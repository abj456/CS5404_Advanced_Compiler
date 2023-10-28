#include "llvm/IR/PassManager.h"
#include "llvm/Passes/PassBuilder.h"
#include "llvm/Passes/PassPlugin.h"

#include "llvm/IR/Instructions.h"
#include "llvm/Analysis/LoopInfo.h"
#include "llvm/Analysis/ScalarEvolution.h"
#include "llvm/Pass.h"
#include "llvm/IR/Constants.h"

#include "llvm/IR/Function.h"
#include "llvm/Support/raw_ostream.h"
#include <bits/stdc++.h>

using namespace llvm;
using namespace std;
namespace {

    struct HW1Pass : public PassInfoMixin<HW1Pass> {
        PreservedAnalyses run(Function& F, FunctionAnalysisManager& FAM);
        int getConstantInt(Value& v);

        void findFlowAntiDep(deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement, unordered_map<int, deque<int>>& flow_anti_dep,
            unordered_map<int, vector<pair<int, int>>>& coef, vector<bool>& fa_dep);

        deque<string> outputFlowDep(Loop* L, ScalarEvolution& SE, deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement,
            unordered_map<int, deque<int>>& flow_anti_dep, unordered_map<int, vector<pair<int, int>>>& coef, vector<bool>& fa_dep);

        void findOutDep(deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement, unordered_map<int, deque<int>>& output_dep,
            unordered_map<int, vector<pair<int, int>>>& coef, vector<bool>& out_dep);

        deque<string> outputAntiDep(Loop* L, ScalarEvolution& SE, deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement,
            unordered_map<int, deque<int>>& flow_anti_dep, unordered_map<int, vector<pair<int, int>>>& coef, vector<bool>& fa_dep);

        deque<string> outputOutDep(Loop* L, ScalarEvolution& SE, deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement,
            unordered_map<int, deque<int>>& output_dep, unordered_map<int, vector<pair<int, int>>>& coef, vector<bool>& out_dep);

        // void printDep(deque<)

        bool checkFlowOrAntiDep(vector<pair<int, int>> coef);

        vector<pair<int, int>> ExprCoefParsing(string& LHS, string& RHS);

        string InstructionExpressionParsing(Instruction* parse_inst);
    };

    int HW1Pass::getConstantInt(Value& v) {
        ConstantInt* CI = dyn_cast<ConstantInt>(&v);
        return CI->getSExtValue();
    }

    PreservedAnalyses HW1Pass::run(Function& F, FunctionAnalysisManager& FAM) {
        // errs() << "[HW1]: " << F.getName() << '\n';

        /* get start and end information from LoopAnalysis */
        auto& LI = FAM.getResult<LoopAnalysis>(F);
        for (auto L : LI) {
            deque<deque<string>> printFlowDep;
            deque<deque<string>> printAntiDep;
            deque<deque<string>> printOutputDep;
            /* extract start & end of a loop */
            ScalarEvolution& SE = FAM.getResult<ScalarEvolutionAnalysis>(F);
            // Value& VStart = L->getBounds(SE)->getInitialIVValue();
            // Value& VEnd = L->getBounds(SE)->getFinalIVValue();
            // int loop_start = getConstantInt(VStart);
            // int loop_end = getConstantInt(VEnd);
            // ICmpInst* LoopCmpInst = L->getLatchCmpInst();
            // errs() << "Type: " << *VStart.getType() << ", Value: " << loop_start << '\n';
            // errs() << "Type: " << *VEnd.getType() << ", Value: " << loop_end << '\n';
            // errs() << "Latch: " << *LoopCmpInst << '\n';

            // PHINode* phi_n = L->getInductionVariable(SE);
            // errs() << "PHINode: " << *phi_n << '\n';
            // errs() << "PHINode getIncomingValue: " << *phi_n->getIncomingValue(0) << '\n';
            // errs() << "PHINode getIncomingValue: " << *phi_n->getIncomingValue(1) << '\n';
            // errs() << "PHINode getName: " << phi_n->getName() << '\n';

            auto& blockVector = L->getBlocksVector();
            for (BasicBlock* BB : blockVector) {
                stack<GetElementPtrInst*> GEPInst_ArrayStack;
                vector<vector<GetElementPtrInst*>> stmts_vector;

                /* extract assign-statement */
                for (Instruction& I : *BB) {
                    if (GetElementPtrInst* GEPInst = dyn_cast<GetElementPtrInst>(&I)) {
                        GEPInst_ArrayStack.push(GEPInst);
                    }
                    if (StoreInst* SI = dyn_cast<StoreInst>(&I)) {
                        vector<GetElementPtrInst*> stmt_vector; // store arr_var info of each stmt
                        while (!GEPInst_ArrayStack.empty()) {
                            stmt_vector.push_back(GEPInst_ArrayStack.top());
                            GEPInst_ArrayStack.pop();
                        }
                        stmts_vector.push_back(stmt_vector); // store all stmt info
                    }
                }

                /* build vector to record LHS & RHS of each assign-statement */
                deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>> statement;
                for (auto& stmt : stmts_vector) {
                    vector<GetElementPtrInst*> assignOp_rhs_inst;
                    for (auto& arr_inst : stmt) {
                        if (arr_inst != stmt[0]) {
                            assignOp_rhs_inst.push_back(arr_inst);
                        }
                    }
                    statement.push_back(make_pair(stmt[0], assignOp_rhs_inst));
                }

                /* find flow dependence */
                deque<string> depReg;

                unordered_map<int, deque<int>> flow_anti_dep;
                unordered_map<int, vector<pair<int, int>>> fa_coef;
                vector<bool> fa_dep;
                findFlowAntiDep(statement, flow_anti_dep, fa_coef, fa_dep);
                depReg = outputFlowDep(L, SE, statement, flow_anti_dep, fa_coef, fa_dep);
                printFlowDep.push_back(depReg);

                /* find anti dependence */
                depReg = outputAntiDep(L, SE, statement, flow_anti_dep, fa_coef, fa_dep);
                printAntiDep.push_back(depReg);

                /* find output dependence */
                unordered_map<int, deque<int>> output_dep;
                unordered_map<int, vector<pair<int, int>>> out_coef;
                vector<bool> out_dep;
                findOutDep(statement, output_dep, out_coef, out_dep);
                depReg = outputOutDep(L, SE, statement, output_dep, out_coef, out_dep);
                printOutputDep.push_back(depReg);
            }
            errs() << "====Flow Dependency====\n";
            for (auto d : printFlowDep) {
                for (auto s : d) {
                    errs() << s;
                }
            }

            errs() << "====Anti Dependency====\n";
            for (auto d : printAntiDep) {
                for (auto s : d) {
                    errs() << s;
                }
            }

            errs() << "====Output Dependency====\n";
            for (auto d : printOutputDep) {
                for (auto s : d) {
                    errs() << s;
                }
            }
        }
        return PreservedAnalyses::all();
    }

    void HW1Pass::findOutDep(deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement, unordered_map<int, deque<int>>& output_dep,
        unordered_map<int, vector<pair<int, int>>>& out_coef, vector<bool>& out_dep) {

        for (int i = 1; i <= statement.size(); i++) {
            out_dep.push_back(false);
            deque<int> dep;
            Value* assignOp_lhs_inst = statement[i - 1].first->getOperand(0);
            int idx = i - 1;

            for (int j = i + 1; j <= statement.size(); j++) {
                // for (auto assignOp_lhs_inst_finding : statement[j - 1].second) {
                auto assignOp_lhs_inst_finding = statement[j - 1].first;
                // find whether there is a same arr variable
                if (assignOp_lhs_inst_finding->getOperand(0) == assignOp_lhs_inst) {
                    string LHS_str, LHS__finding_str;
                    Instruction* LHS_expr_inst = dyn_cast<Instruction>(statement[idx].first->getOperand(2));
                    Instruction* LHS__findingexpr_inst = dyn_cast<Instruction>(assignOp_lhs_inst_finding->getOperand(2));

                    /* LHS parsing*/
                    Instruction* LHS_parse_inst = dyn_cast<Instruction>(LHS_expr_inst->getOperand(0));
                    Instruction* LHS__findingparse_inst = dyn_cast<Instruction>(LHS__findingexpr_inst->getOperand(0));
                    LHS_str = InstructionExpressionParsing(LHS_parse_inst);
                    LHS__finding_str = InstructionExpressionParsing(LHS__findingparse_inst);


                    out_coef[i] = ExprCoefParsing(LHS_str, LHS__finding_str);
                    out_dep[idx] = checkFlowOrAntiDep(out_coef[i]);
                    // errs() << "check flow dep: " << out_dep[i - 1] << '\n';
                    if (out_dep[idx]) {
                        dep.push_back(j);
                        break;
                    }
                }
                // }
            }
            output_dep[i] = dep;
        }
    }

    deque<string> HW1Pass::outputOutDep(Loop* L, ScalarEvolution& SE, deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement,
        unordered_map<int, deque<int>>& output_dep, unordered_map<int, vector<pair<int, int>>>& coef, vector<bool>& out_dep) {

        int loop_start = getConstantInt(L->getBounds(SE)->getInitialIVValue());
        int loop_end = getConstantInt(L->getBounds(SE)->getFinalIVValue());
        PHINode* phi_n = L->getInductionVariable(SE);
        ICmpInst* LoopCmpInst = L->getLatchCmpInst();

        /* print output dependence */
        string reg;
        deque<string> printOutDep;

        for (int i = 1; i <= statement.size(); i++) {
            int inc = getConstantInt(*dyn_cast<Instruction>(phi_n->getIncomingValue(1))->getOperand(1));
            if (out_dep[i - 1]) {
                // errs() << "====Output Dependency====\n";
                // reg = "====Output Dependency====\n";
                // printOutDep.push_back(reg);

                if (LoopCmpInst->isLT(LoopCmpInst->getPredicate())) { // i < 20
                    /* print output dep */
                    for (auto j : output_dep[i]) {
                        for (int i_L = loop_start; i_L < loop_end; i_L = i_L + inc) {
                            for (int i_R = loop_start; i_R < loop_end; i_R = i_R + inc) {
                                int lhs = i_L * coef[i][0].first + coef[i][0].second;
                                int rhs = i_R * coef[i][1].first + coef[i][1].second;
                                if (lhs == rhs) {
                                    if (i_L <= i_R) {
                                        // errs() << "(i=" << i_L << ",i=" << i_R << ")\n";
                                        reg = "(i=" + to_string(i_L) + ",i=" + to_string(i_R) + ")\n";
                                        printOutDep.push_back(reg);

                                        // errs() << statement[i - 1].first->getPointerOperand()->getName() << ":S"
                                        //     << i << " --O--> S" << j << '\n';
                                        reg = (string)statement[i - 1].first->getPointerOperand()->getName() + ":S"
                                            + to_string(i) + " --O--> S" + to_string(j) + '\n';
                                        printOutDep.push_back(reg);
                                    }
                                    else if (i_L > i_R) {
                                        // errs() << "(i=" << i_R << ",i=" << i_L << ")\n";
                                        reg = "(i=" + to_string(i_R) + ",i=" + to_string(i_L) + ")\n";
                                        printOutDep.push_back(reg);

                                        // errs() << statement[i - 1].first->getPointerOperand()->getName() << ":S"
                                        //     << j << " --O--> S" << i << '\n';
                                        reg = (string)statement[i - 1].first->getPointerOperand()->getName() + ":S" + to_string(j)
                                            + " --O--> S" + to_string(i) + '\n';
                                        printOutDep.push_back(reg);

                                    }
                                }
                            }
                        }
                    }
                    // for (string s : printOutDep) {
                    //     errs() << s;
                    // }
                }
            }
        }
        return printOutDep;
    }

    void HW1Pass::findFlowAntiDep(deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement, unordered_map<int, deque<int>>& flow_anti_dep,
        unordered_map<int, vector<pair<int, int>>>& flow_anti_coef, vector<bool>& fa_dep) {

        for (int i = 1; i <= statement.size(); i++) {
            fa_dep.push_back(false);
            deque<int> dep;
            Value* assignOp_lhs_inst = statement[i - 1].first->getOperand(0);
            int idx = i - 1;

            for (int j = 1; j <= statement.size(); j++) {
                for (auto assignOp_rhs_inst : statement[j - 1].second) {
                    // find whether there is a same arr variable
                    if (assignOp_rhs_inst->getOperand(0) == assignOp_lhs_inst) {
                        string LHS_str, RHS_str;
                        Instruction* LHS_expr_inst = dyn_cast<Instruction>(statement[idx].first->getOperand(2));
                        Instruction* RHS_expr_inst = dyn_cast<Instruction>(assignOp_rhs_inst->getOperand(2));
                        // errs() << "LHS expr inst: " << *LHS_expr_inst << '\n';
                        // errs() << "LHS get inst operand num: " << dyn_cast<Instruction>(LHS_expr_inst->getOperand(0))->getOpcodeName() << '\n';
                        // errs() << "RHS expr inst: " << *RHS_expr_inst << '\n';
                        // errs() << "RHS get inst operand num: " << dyn_cast<Instruction>(RHS_expr_inst->getOperand(0))->getOpcodeName() << '\n';

                        /* LHS parsing*/
                        Instruction* LHS_parse_inst = dyn_cast<Instruction>(LHS_expr_inst->getOperand(0));
                        Instruction* RHS_parse_inst = dyn_cast<Instruction>(RHS_expr_inst->getOperand(0));
                        LHS_str = InstructionExpressionParsing(LHS_parse_inst);
                        RHS_str = InstructionExpressionParsing(RHS_parse_inst);

                        // errs() << "LHS_str: " << LHS_str << '\n';
                        // errs() << "RHS_str: " << RHS_str << '\n';

                        flow_anti_coef[i] = ExprCoefParsing(LHS_str, RHS_str);
                        fa_dep[idx] = checkFlowOrAntiDep(flow_anti_coef[i]);
                        // errs() << "check flow dep: " << fa_dep[i - 1] << '\n';
                        if (fa_dep[idx]) {
                            dep.push_back(j);
                            break;
                        }
                    }
                }
            }
            flow_anti_dep[i] = dep;
            // errs() << "statement " << i << " dependence" << ": ";
            // for (auto j : flow_anti_dep[i]) {
            //     errs() << j << ' ';
            // }
            // errs() << '\n';
        }
    }

    deque<string> HW1Pass::outputFlowDep(Loop* L, ScalarEvolution& SE, deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement,
        unordered_map<int, deque<int>>& flow_anti_dep, unordered_map<int, vector<pair<int, int>>>& flow_anti_coef, vector<bool>& fa_dep) {

        int loop_start = getConstantInt(L->getBounds(SE)->getInitialIVValue());
        int loop_end = getConstantInt(L->getBounds(SE)->getFinalIVValue());
        PHINode* phi_n = L->getInductionVariable(SE);
        ICmpInst* LoopCmpInst = L->getLatchCmpInst();


        /* print flow dependence */
        string reg;
        deque<string> printFlowDep;

        for (int i = 1; i <= statement.size(); i++) {
            int idx = i - 1;
            int inc = getConstantInt(*dyn_cast<Instruction>(phi_n->getIncomingValue(1))->getOperand(1));
            if (fa_dep[idx]) {
                // errs() << "====Flow Dependency====\n";
                // reg = "====Flow Dependency====\n";
                // printFlowDep.push_back(reg);

                if (LoopCmpInst->isLT(LoopCmpInst->getPredicate())) { // i < 20
                    /* print flow dep */
                    for (auto j : flow_anti_dep[i]) {
                        for (int i_L = loop_start; i_L < loop_end; i_L = i_L + inc) {
                            for (int i_R = loop_start; i_R < loop_end; i_R = i_R + inc) {
                                int lhs = i_L * flow_anti_coef[i][0].first + flow_anti_coef[i][0].second;
                                int rhs = i_R * flow_anti_coef[i][1].first + flow_anti_coef[i][1].second;
                                if ((lhs == rhs) && (i_L <= i_R)) {
                                    // errs() << "(i=" << i_L << ",i=" << i_R << ")\n";
                                    reg = "(i=" + to_string(i_L) + ",i=" + to_string(i_R) + ")\n";
                                    printFlowDep.push_back(reg);

                                    // errs() << statement[i - 1].first->getPointerOperand()->getName() << ":S"
                                    //     << i << " -----> S" << j << '\n';
                                    reg = (string)statement[i - 1].first->getPointerOperand()->getName() + ":S"
                                        + to_string(i) + " -----> S" + to_string(j) + '\n';
                                    printFlowDep.push_back(reg);
                                }
                            }
                        }
                    }
                }
            }
        }
        // for (string s : printFlowDep) {
        //     errs() << s;
        // }
        return printFlowDep;
    }

    deque<string> HW1Pass::outputAntiDep(Loop* L, ScalarEvolution& SE, deque<pair<GetElementPtrInst*, vector<GetElementPtrInst*>>>& statement,
        unordered_map<int, deque<int>>& flow_anti_dep, unordered_map<int, vector<pair<int, int>>>& flow_anti_coef, vector<bool>& fa_dep) {

        int loop_start = getConstantInt(L->getBounds(SE)->getInitialIVValue());
        int loop_end = getConstantInt(L->getBounds(SE)->getFinalIVValue());
        PHINode* phi_n = L->getInductionVariable(SE);
        ICmpInst* LoopCmpInst = L->getLatchCmpInst();


        /* print anti dependence */
        string reg;
        deque<string> printAntiDep;

        for (int i = 1; i <= statement.size(); i++) {
            int idx = i - 1;
            int inc = getConstantInt(*dyn_cast<Instruction>(phi_n->getIncomingValue(1))->getOperand(1));
            if (fa_dep[idx]) {
                // errs() << "====Anti-Dependency====\n";
                // reg = "====Anti-Dependency====\n";
                // printAntiDep.push_back(reg);

                if (LoopCmpInst->isLT(LoopCmpInst->getPredicate())) { // i < 20
                    /* print anti dep */
                    for (auto j : flow_anti_dep[i]) {
                        for (int i_L = loop_start; i_L < loop_end; i_L = i_L + inc) {
                            for (int i_R = loop_start; i_R < loop_end; i_R = i_R + inc) {
                                int lhs = i_L * flow_anti_coef[i][0].first + flow_anti_coef[i][0].second;
                                int rhs = i_R * flow_anti_coef[i][1].first + flow_anti_coef[i][1].second;
                                if ((lhs == rhs) && (i_L > i_R)) {
                                    // errs() << "(i=" << i_R << ",i=" << i_L << ")\n";
                                    reg = "(i=" + to_string(i_R) + ",i=" + to_string(i_L) + ")\n";
                                    printAntiDep.push_back(reg);

                                    // errs() << statement[i - 1].first->getPointerOperand()->getName() << ":S"
                                    //     << j << " --A--> S" << i << '\n';
                                    reg = (string)statement[i - 1].first->getPointerOperand()->getName() + ":S"
                                        + to_string(j) + " --A--> S" + to_string(i) + '\n';
                                    printAntiDep.push_back(reg);
                                }
                            }
                        }
                    }
                }
            }
        }
        // for (string s : printAntiDep) {
        //     errs() << s;
        // }
        return printAntiDep;
    }

    string HW1Pass::InstructionExpressionParsing(Instruction* parse_inst) {
        string result;
        if (!strcmp(parse_inst->getOpcodeName(), "phi")) {
            result.append(parse_inst->getName());
        }
        else if (!strcmp(parse_inst->getOpcodeName(), "sub")) {
            // errs() << "Parsing Inst Operand: " << *parse_inst << '\n';
            result.append(InstructionExpressionParsing(dyn_cast<Instruction>(parse_inst->getOperand(0))));
            // errs() << "Parsing result string debug: " << result << '\n';

            int const_int = getConstantInt(*parse_inst->getOperand(1));
            // errs() << "Parsing Inst 2nd Operand: " << const_int << '\n';
            result = result + " - " + to_string(const_int);
        }
        else if (!strcmp(parse_inst->getOpcodeName(), "add")) {
            // errs() << "Parsing Inst Operand: " << *parse_inst << '\n';
            result.append(InstructionExpressionParsing(dyn_cast<Instruction>(parse_inst->getOperand(0))));
            // errs() << "Parsing result string debug: " << result << '\n';

            int const_int = getConstantInt(*parse_inst->getOperand(1));
            // errs() << "Parsing Inst 2nd Operand: " << const_int << '\n';
            result = result + " + " + to_string(const_int);
        }
        else if (!strcmp(parse_inst->getOpcodeName(), "mul")) {
            // errs() << "Parsing Inst Operand: " << *parse_inst << '\n';
            result.append(InstructionExpressionParsing(dyn_cast<Instruction>(parse_inst->getOperand(1))));
            // errs() << "Parsing result string debug: " << result << '\n';

            int const_int = getConstantInt(*parse_inst->getOperand(0));
            // errs() << "Parsing Inst 2nd Operand: " << const_int << '\n';
            result = to_string(const_int) + " * " + result;
        }
        return result;
    }

    vector<pair<int, int>> HW1Pass::ExprCoefParsing(string& LHS, string& RHS) {
        vector<pair<int, int>> ret;
        int c = 1, j = 0; // LHS coeff
        int d = 1, k = 0; // RHS coeff
        stringstream ssLHS(LHS);
        stringstream ssRHS(RHS);
        string word;

        int idx_read_flag = 0;
        int add_sub_flag = 1;
        while (ssLHS >> word) {
            // errs() << "parsing LHS: " << word << '\n';
            if (isdigit(word[0])) {
                if (!idx_read_flag) {
                    c = stoi(word);
                    // idx_read_flag = 1;
                    // errs() << "LHS coef c: " << c << '\n';
                }
                else {
                    j = stoi(word) * add_sub_flag;
                    // errs() << "LHS coef j: " << j << '\n';
                }
            }
            else if (isalpha(word[0])) {
                idx_read_flag = 1;
            }
            else if (word[0] == '-') {
                add_sub_flag = -1;
            }
            else if (word[0] == '+') {
                add_sub_flag = 1;
            }
        }

        idx_read_flag = 0;
        add_sub_flag = 1;
        while (ssRHS >> word) {
            // errs() << "parsing RHS: " << word << '\n';
            if (isdigit(word[0])) {
                if (!idx_read_flag) {
                    d = stoi(word);
                    // errs() << "RHS coef d: " << d << '\n';
                }
                else {
                    k = stoi(word) * add_sub_flag;
                    // errs() << "RHS coef k: " << k << '\n';
                }
            }
            else if (isalpha(word[0])) {
                idx_read_flag = 1;
            }
            else if (word[0] == '-') {
                add_sub_flag = -1;
            }
            else if (word[0] == '+') {
                add_sub_flag = 1;
            }
        }
        ret.push_back(make_pair(c, j));
        ret.push_back(make_pair(d, k));
        return ret;
    }

    bool HW1Pass::checkFlowOrAntiDep(vector<pair<int, int>> coef) {
        int c = coef[0].first, j = coef[0].second;
        int d = coef[1].first, k = coef[1].second;

        if ((k - j) % __gcd(c, d) == 0) {
            return true;
        }
        return false;
    }
} // end anonymous namespace

extern "C" ::llvm::PassPluginLibraryInfo LLVM_ATTRIBUTE_WEAK
llvmGetPassPluginInfo() {
    return { LLVM_PLUGIN_API_VERSION, "HW1Pass", LLVM_VERSION_STRING,
            [](PassBuilder& PB) {
                PB.registerPipelineParsingCallback(
                    [](StringRef Name, FunctionPassManager& FPM,
                       ArrayRef<PassBuilder::PipelineElement>) {
                        if (Name == "hw1") {
                            FPM.addPass(HW1Pass());
                            return true;
                        }
                        return false;
                    });
            } };
}