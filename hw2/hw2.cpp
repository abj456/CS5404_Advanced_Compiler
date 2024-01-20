#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include "llvm/IR/Function.h"
#include "llvm/IR/Instructions.h"
#include "llvm/IR/BasicBlock.h"
#include "llvm/IR/Constants.h"

#include "llvm/Pass.h"
#include "llvm/Support/raw_ostream.h"

#include <bits/stdc++.h>


using namespace llvm;
using namespace std;

namespace {
    class var {
    public:
        string name;
        string type;
        var(string n, string t) {
            this->name = n;
            this->type = t;
        }
    };
    class statement {
    public:
        deque<Instruction*> insts;
        string lhs_code;
        string rhs_code;
        statement(deque<Instruction*> Si_inst) {
            insts = Si_inst;
        }
    };

    struct HW2Pass : public PassInfoMixin<HW2Pass> {
        deque<var> variables;
        deque<statement> statements;
        deque<Instruction*> Si_inst;

        void Si_parse(int i);
        string Si_parseRHS(Instruction* SrInst);
        string Si_parseLHS(Instruction* SrInst);

        deque<deque<string>> TREF;
        deque<deque<string>> TGEN;
        deque<deque<pair<string, string>>> TDEF;
        deque<deque<pair<string, string>>> TEQUIV;

        void checkDequeVar(deque<var>& vars);
        void checkDequeStmt(deque<statement>& stmts);
        void checkDequeSi(deque<statement>& stmts, int i);

        void parseTREF(int i);
        void printTREF(int i);

        void parseTGEN(int i);
        void printTGEN(int i);

        void parseDep(int i);

        void parseTDEF(int i);
        void printTDEF(int i);

        void parseTEQUIV(int i);
        void printTEQUIV(int i);

        PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
    };

    void HW2Pass::parseDep(int i) {
        errs() << "DEP:{";

        if (i != 0) {
            // flow-dependence
            bool print_flag = false;
            for (auto tref : TREF[i]) {
                for (auto tdef : TDEF[i - 1]) {
                    if (tref.compare(tdef.first) == 0) {
                        if (!print_flag) {
                            print_flag = true;
                            errs() << '\n';
                        }
                        errs() << "    " << tdef.first << ": " << tdef.second << "--->S" << i + 1 << '\n';
                    }
                }
            }

            // output-dependence
            for (auto tgen : TGEN[i]) {
                for (auto tdef : TDEF[i - 1]) {
                    if (tgen.compare(tdef.first) == 0) {
                        if (!print_flag) {
                            print_flag = true;
                            errs() << '\n';
                        }
                        errs() << "    " << tdef.first << ": " << tdef.second << "-O->S" << i + 1 << '\n';
                    }
                }
            }
        }

        errs() << "}\n";
    }

    void HW2Pass::parseTEQUIV(int i) {
        if (i != 0) {
            TEQUIV[i] = TEQUIV[i - 1];
        }
        // remove TGEN element appearing as proper subtree in TEQUIV
        for (auto tgen : TGEN[i]) {
            for (int j = 0; j < TEQUIV[i].size(); j++) {
                if (tgen.compare(TEQUIV[i][j].first.substr(1)) == 0 || tgen.compare(TEQUIV[i][j].second.substr(1)) == 0) {
                    TEQUIV[i].erase(TEQUIV[i].begin() + j);
                    j--;
                }
            }
        }

        char* rhs_expr = strdup(statements[i].rhs_code.c_str());
        const char* delimiter = " +,";
        char* rhs_parse = strtok(rhs_expr, delimiter);
        while (rhs_parse != NULL) {
            if (rhs_parse[0] == '&') {
                TEQUIV[i].push_back(make_pair("*" + statements[i].lhs_code, rhs_parse + 1));
            }
            rhs_parse = strtok(NULL, delimiter);
        }

        // transitive closure
        // (j, k), (i, j) -> (i, k)
        // errs() << "working on transitive closure in TEQUIV, checking\n";
        for (int a = 0; a < TEQUIV[i].size(); a++) {
            for (int b = 0; b < TEQUIV[i].size(); b++) {
                if (a == b) continue;
                int a_star = count(TEQUIV[i][a].first.begin(), TEQUIV[i][a].first.end(), '*');
                int b_star = count(TEQUIV[i][b].second.begin(), TEQUIV[i][b].second.end(), '*');
                const char* deli = "*";
                char* a_var = strtok(strdup(TEQUIV[i][a].first.c_str()), deli);
                char* b_var = strtok(strdup(TEQUIV[i][b].second.c_str()), deli);
                // errs() << a_star << a_var << ", " << b_star << b_var << '\n';

                if (strcmp(a_var, b_var) == 0) {
                    // errs() << a_star << a_var << ", " << b_star << b_var << '|';
                    string c_var = TEQUIV[i][b].first;
                    string d_var = TEQUIV[i][a].second;
                    if (a_star > b_star) {
                        for (int k = b_star; k < a_star; k++) {
                            c_var = "*" + c_var;
                        }
                    }
                    else if (a_star < b_star) {
                        for (int k = a_star; k < b_star; k++) {
                            d_var = "*" + d_var;
                        }
                    }
                    // errs() << c_var << ", " << d_var << '\n';
                    if (find(TEQUIV[i].begin(), TEQUIV[i].end(), make_pair(c_var, d_var)) == TEQUIV[i].end()) {
                        TEQUIV[i].push_back(make_pair(c_var, d_var));
                    }
                }
            }
        }
        // (i, k), (i, j) -> (j, k)
        for (int a = 0; a < TEQUIV[i].size(); a++) {
            for (int b = 0; b < TEQUIV[i].size(); b++) {
                if (a == b) continue;
                int a_star = count(TEQUIV[i][a].first.begin(), TEQUIV[i][a].first.end(), '*');
                int b_star = count(TEQUIV[i][b].first.begin(), TEQUIV[i][b].first.end(), '*');
                const char* deli = "*";
                char* a_var = strtok(strdup(TEQUIV[i][a].first.c_str()), deli);
                char* b_var = strtok(strdup(TEQUIV[i][b].first.c_str()), deli);

                if (strcmp(a_var, b_var) == 0) {
                    string c_var = TEQUIV[i][a].second;
                    string d_var = TEQUIV[i][b].second;
                    if (a_star > b_star) {
                        for (int k = b_star; k < a_star; k++) {
                            d_var = "*" + d_var;
                        }
                        if (find(TEQUIV[i].begin(), TEQUIV[i].end(), make_pair(d_var, c_var)) == TEQUIV[i].end()) {
                            TEQUIV[i].push_back(make_pair(d_var, c_var));
                        }
                    }
                    else if (a_star < b_star) {
                        for (int k = a_star; k < b_star; k++) {
                            c_var = "*" + c_var;
                        }
                        if (find(TEQUIV[i].begin(), TEQUIV[i].end(), make_pair(c_var, d_var)) == TEQUIV[i].end()) {
                            TEQUIV[i].push_back(make_pair(c_var, d_var));
                        }
                    }
                    // errs() << c_var << ", " << d_var << '\n';
                }
            }
        }
        // errs() << "end checking\n";
    }

    void HW2Pass::printTEQUIV(int i) {
        errs() << "TEQUIV: {";
        for (int j = 0; j < TEQUIV[i].size(); j++) {
            (j == 0) ? (errs() << "(" << TEQUIV[i][j].first << ", " << TEQUIV[i][j].second << ")")
                : (errs() << ", (" << TEQUIV[i][j].first << ", " << TEQUIV[i][j].second << ")");
        }
        errs() << "}\n";
    }

    void HW2Pass::parseTDEF(int i) {
        if (i == 0) {
            for (auto tg : TGEN[i]) {
                TDEF[i].push_back(make_pair(tg, "S" + to_string(i + 1)));
            }
        }
        else {
            TDEF[i] = TDEF[i - 1];

            // remove common elements with TGEN(i)
            // for (int j = 0; j < TDEF[i].size(); j++) {
            //     for (auto tgen: TGEN[i]) {
            //         if (TDEF[i][j].first.compare(tgen) == 0) {
            //             TDEF[i].erase(TDEF[i].begin() + j);
            //             j--;
            //             break;
            //         }
            //     }
            // }

            for (auto& td : TDEF[i]) {
                for (auto tg : TGEN[i]) {
                    if (td.first.compare(tg) == 0) {
                        // errs() << td.first << ", " << td.second << '\n';
                        td.second = "S" + to_string(i + 1);
                        // errs() << td.first << ", " << td.second << '\n';
                    }
                }
            }
            for (auto tg : TGEN[i]) {
                if (find(TDEF[i].begin(), TDEF[i].end(), make_pair(tg, "S" + to_string(i + 1))) == TDEF[i].end()) {
                    TDEF[i].push_back(make_pair(tg, "S" + to_string(i + 1)));
                }
            }
        }
    }

    void HW2Pass::printTDEF(int i) {
        errs() << "TDEF: {";
        for (int j = 0; j < TDEF[i].size(); j++) {
            (j == 0) ? (errs() << "(" << TDEF[i][j].first << ", " << TDEF[i][j].second << ")")
                : (errs() << ", (" << TDEF[i][j].first << ", " << TDEF[i][j].second << ")");
        }
        errs() << "}\n";
    }

    void HW2Pass::parseTGEN(int i) {
        TGEN[i].push_back(statements[i].lhs_code);
        // search TEQUIV
        if (i != 0) {
            for (auto tgen : TGEN[i]) {
                for (auto tequiv : TEQUIV[i - 1]) {
                    // errs() << tgen << ", " << tequiv.first << ", " << tequiv.second << '\n';
                    if (tgen.compare(tequiv.first) == 0) {
                        TGEN[i].push_back(tequiv.second);
                    }
                    else if (tgen.compare(tequiv.second) == 0) {
                        TGEN[i].push_back(tequiv.first);
                    }
                }
            }
        }
    }

    void HW2Pass::printTGEN(int i) {
        errs() << "TGEN: {";
        for (int j = 0; j < TGEN[i].size(); j++) {
            (j == 0) ? (errs() << TGEN[i][j]) : (errs() << ", " << TGEN[i][j]);
        }
        errs() << "}\n";
    }

    void HW2Pass::parseTREF(int i) {
        // errs() << "parseTREF start" << '\n';

        char* rhs_expr = strdup(statements[i].rhs_code.c_str());
        const char* delimiter = " +";
        char* rhs_parse = strtok(rhs_expr, delimiter);
        while (rhs_parse != NULL) {
            if (isdigit(rhs_parse[0]) == 0 && rhs_parse[0] != '&') {
                // TREF[i].push_back(var(rhs_parse, "integer"));
                TREF[i].push_back(rhs_parse);
            }

            rhs_parse = strtok(NULL, delimiter);
        }

        string lhs_expr = statements[i].lhs_code;
        if (lhs_expr[0] == '*') {
            int a = 0;
            do {
                a++;
                // TREF[i].push_back(var(lhs_expr.substr(a), "pointer"));
                TREF[i].push_back(lhs_expr.substr(a));
            } while (lhs_expr[a] == '*');
        }

        // search TEQUIV
        if (i != 0) {
            for (int a = 0; a < TREF[i].size(); a++) {
                for (auto tequiv : TEQUIV[i - 1]) {
                    // errs() << "Debug: " << tequiv.first << ", " << tequiv.second << '\n';
                    if (TREF[i][a].compare(tequiv.first) == 0 && find(TREF[i].begin(), TREF[i].end(), tequiv.second) == TREF[i].end()) {
                        // errs() << "Debug: " << tequiv.first << '\n';
                        // TREF[i].push_back(var("[" + tequiv.second + "]", "pointer"));
                        // TREF[i].push_back(var(tequiv.second, "pointer"));
                        TREF[i].push_back(tequiv.second);
                    }
                    else if (TREF[i][a].compare(tequiv.second) == 0 && find(TREF[i].begin(), TREF[i].end(), tequiv.first) == TREF[i].end()) {
                        // errs() << "Debug: " << tequiv.second << '\n';
                        // TREF[i].push_back(var("[" + tequiv.first + "]", "pointer"));
                        // TREF[i].push_back(var(tequiv.first, "pointer"));
                        TREF[i].push_back(tequiv.first);
                    }
                }
            }
        }

        // errs() << "parseTREF end" << '\n';
    }

    void HW2Pass::printTREF(int i) {
        errs() << "TREF: {";
        for (int j = 0; j < TREF[i].size(); j++) {
            (j == 0) ? (errs() << TREF[i][j]) : (errs() << ", " << TREF[i][j]);
        }
        errs() << "}\n";
    }

    void HW2Pass::checkDequeSi(deque<statement>& stmts, int i) {
        for (auto inst : stmts[i].insts) {
            errs() << *inst << '\n';
        }
    }

    void HW2Pass::checkDequeStmt(deque<statement>& stmts) {
        for (auto s : stmts) {
            for (auto i : s.insts) {
                // cout << *i << endl;
                errs() << *i << "\n";
            }
            // cout << endl;
            errs() << "\n";
        }
    }

    void HW2Pass::checkDequeVar(deque<var>& vars) {
        for (auto i : vars) {
            cout << i.name << ", " << i.type << endl;
        }
    }

    PreservedAnalyses HW2Pass::run(Function& F, FunctionAnalysisManager& FAM) {
        errs() << "[HW2]: " << F.getName() << '\n';

        for (auto& BB : F) {
            for (auto& I : BB) {
                // errs() << I.getOpcodeName() << ", " << I << '\n';
                if (strcmp(I.getOpcodeName(), "alloca") == 0) {
                    AllocaInst* AI = dyn_cast<AllocaInst>(&I);

                    string name = (string)AI->getName();
                    // errs() << name << ", ";

                    string type;
                    raw_string_ostream(type) << *AI->getAllocatedType();
                    // errs() << type << "\n";
                    variables.push_back(var(name, type));
                    continue;
                }
                else {
                    Si_inst.push_back(&I);
                    if (strcmp(I.getOpcodeName(), "store") == 0) {
                        statement si(Si_inst);
                        statements.push_back(si);
                        Si_inst.clear();
                    }
                }
            }
        }
        // checkDequeVar(variables);
        // checkDequeStmt(statements);

        for (int i = 1; i <= statements.size(); i++) {
            Si_parse(i - 1);
            // errs() << statements[i - 1].lhs_code << " = " << statements[i - 1].rhs_code << '\n';
        }

        for (int i = 0; i < statements.size(); i++) {
            // checkDequeSi(statements, i - 1);
            errs() << "S" << i + 1 << ":--------------------\n";
            TREF.push_back(deque<string>());
            parseTREF(i);
            printTREF(i);

            TGEN.push_back(deque<string>());
            parseTGEN(i);
            printTGEN(i);

            parseDep(i);

            TDEF.push_back(deque<pair<string, string>>());
            parseTDEF(i);
            printTDEF(i);


            TEQUIV.push_back(deque<pair<string, string>>());
            parseTEQUIV(i);
            printTEQUIV(i);

            errs() << '\n';
        }



        return PreservedAnalyses::all();
    }

    string HW2Pass::Si_parseRHS(Instruction* Inst) {
        string ret;

        if (strcmp(Inst->getOpcodeName(), "alloca") == 0) {
            ret.append(Inst->getName());
            // errs() << "alloca: " << ret << '\n';
        }
        else if (strcmp(Inst->getOpcodeName(), "add") == 0) {
            if (ConstantInt* CI = dyn_cast<ConstantInt>(Inst->getOperand(0))) {
                ret.append(to_string(CI->getSExtValue()));
            }
            else {
                ret.append(Si_parseRHS(dyn_cast<Instruction>(Inst->getOperand(0))));
            }
            ret.append(" + ");

            if (ConstantInt* CI = dyn_cast<ConstantInt>(Inst->getOperand(1))) {
                ret.append(to_string(CI->getSExtValue()));
            }
            else {
                ret.append(Si_parseRHS(dyn_cast<Instruction>(Inst->getOperand(1))));
            }
            // errs() << "add: " << ret << '\n';
        }
        else if (strcmp(Inst->getOpcodeName(), "load") == 0) {
            // errs() << "load operand 0: " << *Inst->getOperand(0) << ", " << *Inst->getOperand(0)->getType() << '\n';
            if (strcmp((dyn_cast<Instruction>(Inst->getOperand(0)))->getOpcodeName(), "load") == 0) {
                ret.append("*");
            }
            ret.append(Si_parseRHS(dyn_cast<Instruction>(Inst->getOperand(0))));
        }
        else if (strcmp(Inst->getOpcodeName(), "store") == 0) {
            if (ConstantInt* CI = dyn_cast<ConstantInt>(Inst->getOperand(0))) {
                // errs() << "this operand is INT, stop\n";
                // exit(0);
                ret = to_string(CI->getSExtValue());
            }
            else if (Inst->getOperand(0)->getType()->isPointerTy()) {
                ret = "&" + Si_parseRHS(dyn_cast<Instruction>(Inst->getOperand(0)));
            }
            else {
                ret = Si_parseRHS(dyn_cast<Instruction>(Inst->getOperand(0)));
            }
            // errs() << "store: " << ret << '\n';
        }

        return ret;
    }

    string HW2Pass::Si_parseLHS(Instruction* SrInst) {
        Instruction* LHS_inst = (strcmp(SrInst->getOpcodeName(), "store") == 0) ? (dyn_cast<Instruction>(SrInst->getOperand(1))) : dyn_cast<Instruction>(SrInst->getOperand(0));

        string ret = "";
        if (strcmp(LHS_inst->getOpcodeName(), "alloca") == 0) {
            ret = LHS_inst->getName();
            return ret;
        }
        else if (strcmp(LHS_inst->getOpcodeName(), "load") == 0) {
            ret = "*" + Si_parseLHS(LHS_inst);
        }

        return ret;
    }

    void HW2Pass::Si_parse(int i) {
        // errs() << "S" << i + 1 << "_parse start\n";
        int inst_i = statements[i].insts.size() - 1;

        string rhs_code = Si_parseRHS(statements[i].insts[inst_i]);

        string lhs_code = Si_parseLHS(statements[i].insts[inst_i]);
        // errs() << lhs_code << " = " << rhs_code << '\n';
        statements[i].lhs_code = lhs_code;
        statements[i].rhs_code = rhs_code;

        // errs() << "S" << i + 1 << "_parse end\n";
    }

} // end anonymous namespace

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK
llvmGetPassPluginInfo() {
    return { LLVM_PLUGIN_API_VERSION, "HW2Pass", LLVM_VERSION_STRING,
            [](PassBuilder& PB) {
              PB.registerPipelineParsingCallback(
                  [](StringRef Name, FunctionPassManager& FPM,
                     ArrayRef<PassBuilder::PipelineElement>) {
                    if (Name == "hw2") {
                      FPM.addPass(HW2Pass());
                      return true;
                    }
                    return false;
                  });
            } };
}