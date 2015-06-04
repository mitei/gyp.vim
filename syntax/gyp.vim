if version < 600
  syntax clear
elseif exists("b:current_syntax")
  finish
endif

syn keyword GYPTopLevelKeywords conditions includes target_defaults targets variables contained
syn keyword GYPOtherKeywords all_dependent_settings configurations copies defines dependenciees direct_dependent_settings include_dirs libraries link_settings rules sources target_conditions target_name type msvs_props xcode_config_file toolset xcode_framework_dirs default_configuration actions dependencies toolsets dependencies_original postbuilds product_dir product_extension product_name product_prefix run_as standalone_static_library suppress_wildcard configuration_name action_name inputs outputs action message rule_name extension inputs outputs action message destination files msvs_cygwin_dirs msvs_cygwin_shell msvs_large_pdb msvs_shard msvs_external_builder msvs_external_builder_out_dir msbuild_settings msvs_external_builder_build_cmd msvs_external_builder_clean_cmd msvs_external_builder_clcompile_cmd msvs_enable_winrt msvs_postbuild msvs_requires_importlibrary msvs_enable_winphone msvs_tool_files msvs_application_type_revision msvs_precompiled_header msvs_precompiled_source msvs_settings msvs_prebuild msbuild_configuration_attributes msvs_configuration_attributes msbuild_toolset mac_framework_dirs xcode_settings ios_app_extension ios_watch_app ios_watchkit_extension mac_bundle mac_bundle_resources mac_framework_headers mac_framework_private_headers mac_xctest_bundle xcode_create_dependents_test_runner contained
syn keyword GYPPredefinedVariables STATIC_LIB_PREFIX STATIC_LIB_SUFFIX SHARED_LIB_PREFIX SHARED_LIB_SUFFIX LIB_DIR EXECUTABLE_PREFIX EXECUTABLE_SUFFIX INTERMEDIATE_DIR SHARED_INTERMEDIATE_DIR PRODUCT_DIR RULE_INPUT_PATH RULE_INPUT_DIRNAME RULE_INPUT_NAME RULE_INPUT_ROOT RULE_INPUT_EXT OS DEPTH CONFIGURATION_NAME contained
syn keyword GYPPredefinedValues none static_library shared_library executable mac win linux
syn keyword GYPMSBuildTools ClCompile Link Lib Midl ResourceCompile PreBuildEvent PostBuildEvent contained

syn keyword GYPCommentTodo      TODO FIXME XXX TBD contained
syn match   GYPComment /#.*$/ contains=GYPCommentTodo

syn match   GYPLibrary /"-l[a-zA-Z0-9\-_.]\+"/ contained

syn match   pythonNumber	"\<0[oO]\=\o\+[Ll]\=\>"
syn match   pythonNumber	"\<0[xX]\x\+[Ll]\=\>"
syn match   pythonNumber	"\<0[bB][01]\+[Ll]\=\>"
syn match   pythonNumber	"\<\%([1-9]\d*\|0\)[Ll]\=\>"
syn match   pythonNumber	"\<\d\+[jJ]\>"
syn match   pythonNumber	"\<\d\+[eE][+-]\=\d\+[jJ]\=\>"
syn match   pythonNumber
\ "\<\d\+\.\%([eE][+-]\=\d\+\)\=[jJ]\=\%(\W\|$\)\@="
syn match   pythonNumber
\ "\%(^\|\W\)\@<=\d*\.\d\+\%([eE][+-]\=\d\+\)\=[jJ]\=\>"

syn match   GYPMerge /\(['"]\).*[+=?]\1/hs=e-1,he=e-1
syn match   GYPDefaultVariable /\(['"]\).*%\1/hs=e-1,he=e-1
syn match   GYPExclusionList /\(['"]\).*!\1/hs=e-1,he=e-1
syn match   GYPPatternList /\(['"]\).*\/\1/hs=e-1,he=e-1

syn region  GYPVariableExpansion oneline matchgroup=GYPExpansion start=/[<>]@\?(/ end=/)/ contains=GYPPredefinedVariables contained
syn region  GYPCommandExpansion oneline matchgroup=GYPExpansion start=/<\?!@\?(/ end=/)/ contains=GYPCommandExpansion contained

syn region  GYPString oneline start=+\z(['"]\)+ skip="\\\z1" end="\z1" contains=GYPTopLevelKeywords,GYPOtherKeywords,GYPPredefinedKeywords,GYPMSBuildTools,GYPLibrary,GYPExpansion,GYPVariableExpansion,GYPCommandExpansion,GYPMerge,GYPDefaultVariable,GYPExclusionList,GYPPatternList,GYPPRedefinedValues,GYPPredefinedVariables

command -nargs=+ HiLink hi def link <args>
HiLink GYPCommentTodo         Todo
HiLink GYPComment             Comment
HiLink pythonNumber           Number
HiLink GYPLibrary             Label
HiLink GYPString              String
HiLink GYPTopLevelKeywords    Statement
HiLink GYPOtherKeywords       Keyword
HiLink GYPPredefinedVariables Identifier
HiLink GYPPredefinedValues    Constant
HiLink GYPMSBuildTools        Special
HiLink GYPExpansion           Delimiter
HiLink GYPVariableExpansion   Identifier
HiLink GYPCommandExpansion    Special
HiLink GYPMerge               Type
HiLink GYPDefaultVariable     Type
HiLink GYPExclusionList       Type
HiLink GYPPatternList         Type
delcommand HiLink

let b:current_syntax = 'gyp'
