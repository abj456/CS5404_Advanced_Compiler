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
PREFIX(prefix_2, {llvm::StringLiteral("-") COMMA llvm::StringLiteral("")})
PREFIX(prefix_1, {llvm::StringLiteral("-") COMMA llvm::StringLiteral("--") COMMA llvm::StringLiteral("")})
PREFIX(prefix_3, {llvm::StringLiteral("--") COMMA llvm::StringLiteral("")})
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
OPTION(prefix_1, llvm::StringLiteral("compilation-database="), compilation_database_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "Compilation database", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("compilation-database"), anonymous_3, Separate, INVALID, compilation_database_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("dependency-target="), dependency_target_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "The names of dependency targets for the dependency file", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("dependency-target"), anonymous_5, Separate, INVALID, dependency_target_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("deprecated-driver-command"), deprecated_driver_command, Flag, INVALID, INVALID, nullptr, 0, 0,
       "use a single driver command to build the tu (deprecated)", nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("eager-load-pcm"), eager_load_pcm, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Load PCM files eagerly (instead of lazily on import)", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("format="), format_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "The output format for the dependencies", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("format"), anonymous_1, Separate, INVALID, format_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_3, llvm::StringLiteral("help"), help, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Display this help", nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("j"), j, Separate, INVALID, INVALID, nullptr, 0, 0,
       "Number of worker threads to use (default: use all concurrent threads)", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("mode="), mode_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "The preprocessing mode used to compute the dependencies", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("mode"), anonymous_0, Separate, INVALID, mode_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("module-files-dir="), module_files_dir_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "The build directory for modules. Defaults to the value of '-fmodules-cache-path=' from command lines for implicit modules", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("module-files-dir"), anonymous_2, Separate, INVALID, module_files_dir_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("module-name="), module_name_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "the module of which the dependencies are to be computed", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("module-name"), anonymous_4, Separate, INVALID, module_name_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("optimize-args"), optimize_args, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Whether to optimize command-line arguments of modules", nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("print-timing"), print_timing, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Print timing information", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("resource-dir-recipe="), resource_dir_recipe_EQ, Joined, INVALID, INVALID, nullptr, 0, 0,
       "How to produce missing '-resource-dir' argument", nullptr, nullptr)
OPTION(prefix_1, llvm::StringLiteral("resource-dir-recipe"), anonymous_6, Separate, INVALID, resource_dir_recipe_EQ, nullptr, 0, 0, nullptr, nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("round-trip-args"), round_trip_args, Flag, INVALID, INVALID, nullptr, 0, 0,
       "verify that command-line arguments are canonical by parsing and re-serializing", nullptr, nullptr)
OPTION(prefix_3, llvm::StringLiteral("version"), version, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Display the version", nullptr, nullptr)
OPTION(prefix_2, llvm::StringLiteral("v"), verbose, Flag, INVALID, INVALID, nullptr, 0, 0,
       "Use verbose output", nullptr, nullptr)
OPTION(prefix_3, llvm::StringLiteral(""), DASH_DASH, RemainingArgs, INVALID, INVALID, nullptr, 0, 0, nullptr, nullptr, nullptr)
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


