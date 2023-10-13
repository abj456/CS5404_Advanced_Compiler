/*===- TableGen'erated file -------------------------------------*- C++ -*-===*\
|*                                                                            *|
|* Option Parsing Definitions                                                 *|
|*                                                                            *|
|* Automatically generated file, do not edit!                                 *|
|*                                                                            *|
\*===----------------------------------------------------------------------===*/

/////////
// Prefixes

#ifdef PREFIX
#define COMMA ,
PREFIX(prefix_0, {llvm::StringLiteral("")})
PREFIX(prefix_3, {llvm::StringLiteral("-") COMMA llvm::StringLiteral("")})
PREFIX(prefix_1, {llvm::StringLiteral("--") COMMA llvm::StringLiteral("")})
PREFIX(prefix_2, {llvm::StringLiteral("--") COMMA llvm::StringLiteral("-") COMMA llvm::StringLiteral("")})
#undef COMMA
#endif // PREFIX

/////////
// Prefix Union

#ifdef PREFIX_UNION
#define COMMA ,
PREFIX_UNION({
llvm::StringLiteral("-") COMMA llvm::StringLiteral("--") COMMA llvm::StringLiteral("")})
#undef COMMA
#endif // PREFIX_UNION

/////////
// ValuesCode

#ifdef OPTTABLE_VALUES_CODE
#endif
/////////
// Groups

#ifdef OPTION

//////////
// Options

OPTION(prefix_0, llvm::StringLiteral("<input>"), INPUT, Input, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_0, llvm::StringLiteral("<unknown>"), UNKNOWN, Unknown, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("arch="), arch_EQ, Joined, INVALID, INVALID, nullptr, DeviceOnlyOption | HelpHidden, 0,
       "The device subarchitecture", "<arch>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("bitcode-library="), bitcode_library_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Extra bitcode library to link", "<kind>-<triple>-<arch>=<path>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("builtin-bitcode="), builtin_bitcode_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Perform a special internalizing link on the bitcode file. This is necessary for some vendor libraries to be linked correctly", "<triple>=<path>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("clang-backend"), clang_backend, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Run the backend using clang rather than the LTO backend", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("cuda-path="), cuda_path_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Set the system CUDA path", "<dir>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("device-debug"), debug, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Use debugging", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("device-linker="), device_linker_args_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Arguments to pass to the device linker invocation", "<value> or <triple>=<value>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("dry-run"), dry_run, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Print program arguments without running", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("embed-bitcode"), embed_bitcode, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Embed linked bitcode in the module", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("help-hidden"), help_hidden, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Display all available options", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("help"), help, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Display available options (--help-hidden for more)", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("host-triple="), host_triple_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Triple to use for the host compilation", "<triple>", nullptr)
OPTION(prefix_2, llvm::StringLiteral("library-path="), library_path_EQ, Joined, INVALID, library_path, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("library-path"), library_path_S, Separate, INVALID, library_path, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("library="), library_EQ, Joined, INVALID, library_path, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("library"), library_S, Separate, INVALID, library_path, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("linker-arg="), linker_arg_EQ, Joined, INVALID, INVALID, nullptr, DeviceOnlyOption | HelpHidden, 0,
       "An extra argument to be passed to the linker", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("linker-path="), linker_path_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "The linker executable to invoke", "<path>", nullptr)
OPTION(prefix_3, llvm::StringLiteral("L"), library_path, JoinedOrSeparate, INVALID, INVALID, nullptr, 0, 0,
       "Add <dir> to the library search path", "<dir>", nullptr)
OPTION(prefix_3, llvm::StringLiteral("l"), library, JoinedOrSeparate, INVALID, INVALID, nullptr, 0, 0,
       "Search for library <libname>", "<libname>", nullptr)
OPTION(prefix_3, llvm::StringLiteral("mllvm"), mllvm, Separate, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Arguments passed to the LLVM invocation", "<arg>", nullptr)
OPTION(prefix_2, llvm::StringLiteral("no-whole-archive"), no_whole_archive, Flag, INVALID, INVALID, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("offload-opt=-"), offload_opt_eq_minus, Joined, INVALID, INVALID, nullptr, HelpHidden | WrapperOnlyOption, 0,
       "Options passed to LLVM", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("opt-level="), opt_level, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Optimization level for LTO", "<O0, O1, O2, or O3>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("output="), output_EQ, Joined, INVALID, o, nullptr, HelpHidden, 0,
       "Alias for -o", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("output"), output, Separate, INVALID, o, nullptr, HelpHidden, 0,
       "Alias for -o", nullptr, nullptr)
OPTION(prefix_3, llvm::StringLiteral("o"), o, JoinedOrSeparate, INVALID, INVALID, nullptr, 0, 0,
       "Path to file to write output", "<path>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("pass-remarks-analysis="), pass_remarks_analysis_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Pass remarks for LTO", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("pass-remarks-missed="), pass_remarks_missed_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Pass remarks for LTO", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("pass-remarks="), pass_remarks_EQ, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Pass remarks for LTO", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("print-wrapped-module"), print_wrapped_module, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Print the wrapped module's IR for testing", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("ptxas-arg="), ptxas_arg, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Argument to pass to the 'ptxas' invocation", nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("rpath="), rpath_EQ, Joined, INVALID, rpath, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("rpath"), rpath, Separate, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("save-temps"), save_temps, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Save intermediate results", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("sysroot"), sysroot_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "Set the system root", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("triple="), triple_EQ, Joined, INVALID, INVALID, nullptr, DeviceOnlyOption | HelpHidden, 0,
       "The device target triple", "<triple>", nullptr)
OPTION(prefix_2, llvm::StringLiteral("version"), version, Flag, INVALID, v, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("v"), v, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Display the version number and exit", nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("whole-archive"), whole_archive, Flag, INVALID, INVALID, nullptr, HelpHidden, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("whole-program"), whole_program, Flag, INVALID, INVALID, nullptr, DeviceOnlyOption | HelpHidden, 0,
       "LTO has visibility of all input files", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("wrapper-jobs="), wrapper_jobs, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Sets the number of parallel jobs to use for device linking", "<number>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("wrapper-time-trace-granularity="), wrapper_time_trace_granularity, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Set the granularity of time-trace updates", "<number>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("wrapper-time-trace="), wrapper_time_trace_eq, Joined, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Enable time-trace and write the output to <file>", "<file>", nullptr)
OPTION(prefix_1, llvm::StringLiteral("wrapper-verbose"), verbose, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "Verbose output from tools", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral(""), separator, Flag, INVALID, INVALID, nullptr, WrapperOnlyOption, 0,
       "The separator for the wrapped linker arguments", nullptr, nullptr)
#endif // OPTION

#ifdef SIMPLE_ENUM_VALUE_TABLE

struct SimpleEnumValue {
  const char *Name;
  unsigned Value;
};

struct SimpleEnumValueTable {
  const SimpleEnumValue *Table;
  unsigned Size;
};
static const SimpleEnumValueTable SimpleEnumValueTables[] = {};
static const unsigned SimpleEnumValueTablesSize = std::size(SimpleEnumValueTables);
#endif // SIMPLE_ENUM_VALUE_TABLE


