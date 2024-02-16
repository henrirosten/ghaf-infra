{
  stdenv,
  fetchurl,
}: let
  mkJenkinsPlugin = {
    name,
    src,
  }:
    stdenv.mkDerivation {
      inherit name src;
      phases = "installPhase";
      installPhase = "cp \$src \$out";
    };
in {
  antisamy-markup-formatter = mkJenkinsPlugin {
    name = "antisamy-markup-formatter";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/antisamy-markup-formatter/162.v0e6ec0fcfcf6/antisamy-markup-formatter.hpi";
      sha256 = "3d4144a78b14ccc4a8f370ccea82c93bd56fadd900b2db4ebf7f77ce2979efd6";
    };
  };
  apache-httpcomponents-client-4-api = mkJenkinsPlugin {
    name = "apache-httpcomponents-client-4-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/apache-httpcomponents-client-4-api/4.5.14-208.v438351942757/apache-httpcomponents-client-4-api.hpi";
      sha256 = "9ed0ccda20a0ea11e2ba5be299f03b30692dd5a2f9fdc7853714507fda8acd0f";
    };
  };
  bootstrap5-api = mkJenkinsPlugin {
    name = "bootstrap5-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/bootstrap5-api/5.3.2-3/bootstrap5-api.hpi";
      sha256 = "30a3a868c7c54f0132f8f0083f410856fe0da214cf7f1ce75be34b96c7a34ae9";
    };
  };
  bouncycastle-api = mkJenkinsPlugin {
    name = "bouncycastle-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/bouncycastle-api/2.30.1.77-225.v26ea_c9455fd9/bouncycastle-api.hpi";
      sha256 = "6b05cf59fde49c687300c8935d34a38c697656ca106c52ef33ab094643c211d8";
    };
  };
  branch-api = mkJenkinsPlugin {
    name = "branch-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/branch-api/2.1148.vce12cfcdf090/branch-api.hpi";
      sha256 = "992dcc2dab50c3bf5f05c206542bfba72a328bdc7a4358873e47f13c972fe32e";
    };
  };
  caffeine-api = mkJenkinsPlugin {
    name = "caffeine-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/caffeine-api/3.1.8-133.v17b_1ff2e0599/caffeine-api.hpi";
      sha256 = "a6c614655bc507345bf16b5c4615bb09b1a20f934c9bf0b15c02ccea4a5c0400";
    };
  };
  checks-api = mkJenkinsPlugin {
    name = "checks-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/checks-api/2.0.2/checks-api.hpi";
      sha256 = "445a5fbd2cea215aee02023a3ae7a1066a1120f29d7280c5777abf9aacc1a631";
    };
  };
  cloudbees-folder = mkJenkinsPlugin {
    name = "cloudbees-folder";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/cloudbees-folder/6.921.vfb_b_224371fb_4/cloudbees-folder.hpi";
      sha256 = "acc07163d72fa82f2a722b238a3eb0f76c5cd336f4f03392383476da313d3f0e";
    };
  };
  command-launcher = mkJenkinsPlugin {
    name = "command-launcher";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/command-launcher/107.v773860566e2e/command-launcher.hpi";
      sha256 = "72e0ae8c9a31ac7f5a3906f7cacd34de26bdca3767bfef87027723850a68ca19";
    };
  };
  commons-lang3-api = mkJenkinsPlugin {
    name = "commons-lang3-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/commons-lang3-api/3.13.0-62.v7d18e55f51e2/commons-lang3-api.hpi";
      sha256 = "e27bbec4d37f26e7da0d0732b241ad0eb2b60826c3f7521808b1442727f54858";
    };
  };
  commons-text-api = mkJenkinsPlugin {
    name = "commons-text-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/commons-text-api/1.11.0-95.v22a_d30ee5d36/commons-text-api.hpi";
      sha256 = "4eaba150d1017c4d643993af2bd8e327c7e322dcfe190e69eeb1ef181162cdf8";
    };
  };
  conditional-buildstep = mkJenkinsPlugin {
    name = "conditional-buildstep";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/conditional-buildstep/1.4.3/conditional-buildstep.hpi";
      sha256 = "d2ce40b86abc42372085ace0a6bb3785d14ae27f0824709dfc2a2b3891a9e8a8";
    };
  };
  config-file-provider = mkJenkinsPlugin {
    name = "config-file-provider";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/config-file-provider/968.ve1ca_eb_913f8c/config-file-provider.hpi";
      sha256 = "9c010a99514c568af980a451561febfb1e1d3a6ceaa6becaa7c90fb7477f183d";
    };
  };
  configuration-as-code = mkJenkinsPlugin {
    name = "configuration-as-code";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/configuration-as-code/1775.v810dc950b_514/configuration-as-code.hpi";
      sha256 = "6c4c864149a7cbca04b402bcdf3b37b0a6501226bffb0d362afd3c774c38de02";
    };
  };
  credentials = mkJenkinsPlugin {
    name = "credentials";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/credentials/1319.v7eb_51b_3a_c97b_/credentials.hpi";
      sha256 = "a237f6ae36ea4a5d7ca194f5667aaafe9bb95ef51e6f7ed607dd1cf3103cd510";
    };
  };
  credentials-binding = mkJenkinsPlugin {
    name = "credentials-binding";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/credentials-binding/657.v2b_19db_7d6e6d/credentials-binding.hpi";
      sha256 = "6e905b964be1c0c0e6591c200d030447d170ec5c2eb5e88bac209e41c1847853";
    };
  };
  display-url-api = mkJenkinsPlugin {
    name = "display-url-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/display-url-api/2.200.vb_9327d658781/display-url-api.hpi";
      sha256 = "2c43127027b16518293b94fa3f1792b7bd3db7234380c6a5249275d480fcbd04";
    };
  };
  durable-task = mkJenkinsPlugin {
    name = "durable-task";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/durable-task/550.v0930093c4b_a_6/durable-task.hpi";
      sha256 = "35b2c004cb9cc2758613018c3d1e9b857d3006c0ecb1d072eebf915309ae276f";
    };
  };
  echarts-api = mkJenkinsPlugin {
    name = "echarts-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/echarts-api/5.4.3-2/echarts-api.hpi";
      sha256 = "c6be841938be63e921645c0e3087e3c1f8e101d8a2ef610322758f86b44928e4";
    };
  };
  font-awesome-api = mkJenkinsPlugin {
    name = "font-awesome-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/font-awesome-api/6.5.1-2/font-awesome-api.hpi";
      sha256 = "ed2726095b73bb1950fa53615cfbbe6f498b576e7d78da01f4dd44a8138e4028";
    };
  };
  git = mkJenkinsPlugin {
    name = "git";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/git/5.2.1/git.hpi";
      sha256 = "d4779c1925e2d82668e62d3a2bc948d0214e86acd4779d045727d84cb9d53e59";
    };
  };
  git-client = mkJenkinsPlugin {
    name = "git-client";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/git-client/4.6.0/git-client.hpi";
      sha256 = "e058089d5ea103a2bb1cad6c80d167adaba9d29778dd092e1f0fc8cfb4442b84";
    };
  };
  github = mkJenkinsPlugin {
    name = "github";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/github/1.38.0/github.hpi";
      sha256 = "39a8831c563e714342be1026044cb27ebf639d2a4a628d5c2e5f049f22ef5f6c";
    };
  };
  github-api = mkJenkinsPlugin {
    name = "github-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/github-api/1.318-461.v7a_c09c9fa_d63/github-api.hpi";
      sha256 = "4c3265f2e6b250e749e890159c04501f3032cbbff2ba4c99b8828b2ad21850c0";
    };
  };
  gson-api = mkJenkinsPlugin {
    name = "gson-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/gson-api/2.10.1-15.v0d99f670e0a_7/gson-api.hpi";
      sha256 = "fa9d125a48224f3add5abb1148269a2ff843c17c43680f994c118f84bf237e3a";
    };
  };
  instance-identity = mkJenkinsPlugin {
    name = "instance-identity";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/instance-identity/185.v303dc7c645f9/instance-identity.hpi";
      sha256 = "dc78c0a23fd3d16a769a78c7822a94862dc7ef37bbebb09cbea3fa06dc67fc6a";
    };
  };
  ionicons-api = mkJenkinsPlugin {
    name = "ionicons-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/ionicons-api/56.v1b_1c8c49374e/ionicons-api.hpi";
      sha256 = "4a6176a2169481fec295c900a6291b3b809b8dd17805868abbdc8a7a322169ca";
    };
  };
  jackson2-api = mkJenkinsPlugin {
    name = "jackson2-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jackson2-api/2.16.1-373.ve709c6871598/jackson2-api.hpi";
      sha256 = "1840d0b101e7418212cd9dd556572e7fe608afa18d7ae10eb31df4aab2954951";
    };
  };
  jakarta-activation-api = mkJenkinsPlugin {
    name = "jakarta-activation-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jakarta-activation-api/2.0.1-3/jakarta-activation-api.hpi";
      sha256 = "fa99c0288dcd24e7bbc857974d07a622d19d48ba71a39564b6c1fa9a14773ed1";
    };
  };
  jakarta-mail-api = mkJenkinsPlugin {
    name = "jakarta-mail-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jakarta-mail-api/2.0.1-3/jakarta-mail-api.hpi";
      sha256 = "af8d0ed38eed3231a078291c4c5f1f0c342970a860a88cdd11ff3ebb606bd3b7";
    };
  };
  javadoc = mkJenkinsPlugin {
    name = "javadoc";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/javadoc/243.vb_b_503b_b_45537/javadoc.hpi";
      sha256 = "0dfffce64e478edcdbbfde2df5913be2ff46e5e033daff8bc9bb616ca7528999";
    };
  };
  javax-activation-api = mkJenkinsPlugin {
    name = "javax-activation-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/javax-activation-api/1.2.0-6/javax-activation-api.hpi";
      sha256 = "8af800837a3bddca75d7f962fbcf535d1c3c214f323fa57c141cecdde61516a9";
    };
  };
  jaxb = mkJenkinsPlugin {
    name = "jaxb";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jaxb/2.3.9-1/jaxb.hpi";
      sha256 = "8c9f7f98d996ade98b7a5dd0cd9d0aba661acea1b99a33f75778bacf39a64659";
    };
  };
  jjwt-api = mkJenkinsPlugin {
    name = "jjwt-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jjwt-api/0.11.5-77.v646c772fddb_0/jjwt-api.hpi";
      sha256 = "cc10fc60c47fe60a585224dad45dde166dd0268cf6efc9967fbf870e3601ceb2";
    };
  };
  job-dsl = mkJenkinsPlugin {
    name = "job-dsl";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/job-dsl/1.87/job-dsl.hpi";
      sha256 = "3de24254966ba99d5184c9dc9fdf553271c8e7400446a6be2ce0117e7928b124";
    };
  };
  joda-time-api = mkJenkinsPlugin {
    name = "joda-time-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/joda-time-api/2.12.7-29.v5a_b_e3a_82269a_/joda-time-api.hpi";
      sha256 = "1d7e8164fee2e8b94e5ac5cf8522b5ab1a3a4ce254591c6c6445227427720697";
    };
  };
  jquery3-api = mkJenkinsPlugin {
    name = "jquery3-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jquery3-api/3.7.1-1/jquery3-api.hpi";
      sha256 = "f9c62c1c7c3886408e8b7ae9b1dca62797793ee27e349dd1106fa28fb43f0040";
    };
  };
  jsch = mkJenkinsPlugin {
    name = "jsch";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/jsch/0.2.16-86.v42e010d9484b_/jsch.hpi";
      sha256 = "f0eb7f7ebaf374f7040e60a56ccd8af6fe471e883957df3a4fff116dda02dc12";
    };
  };
  json-api = mkJenkinsPlugin {
    name = "json-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/json-api/20240205-27.va_007549e895c/json-api.hpi";
      sha256 = "1677b15c2a374f83cce83a621b288aaa6a129dd250529a429f7f8c3bf522c13c";
    };
  };
  json-path-api = mkJenkinsPlugin {
    name = "json-path-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/json-path-api/2.9.0-33.v2527142f2e1d/json-path-api.hpi";
      sha256 = "caf45922242c77ea23d26b40e9b61ae589591b92ff9865ac70116e643b6c2d1e";
    };
  };
  junit = mkJenkinsPlugin {
    name = "junit";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/junit/1259.v65ffcef24a_88/junit.hpi";
      sha256 = "910dbce95add1a108ca1d5c3dda6dcb1308ea79912e258ffcc06426334855f30";
    };
  };
  mailer = mkJenkinsPlugin {
    name = "mailer";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/mailer/463.vedf8358e006b_/mailer.hpi";
      sha256 = "e732d5e291b047a423ced942140c4a0cefa08fe4a40dba69ad5c5af53bba593e";
    };
  };
  mapdb-api = mkJenkinsPlugin {
    name = "mapdb-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/mapdb-api/1.0.9-28.vf251ce40855d/mapdb-api.hpi";
      sha256 = "b924749b6445270cd2ed881f81925fedd71f67a2993473b9172e1e7a9a4023be";
    };
  };
  matrix-project = mkJenkinsPlugin {
    name = "matrix-project";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/matrix-project/822.824.v14451b_c0fd42/matrix-project.hpi";
      sha256 = "8a86b88fa86491307df663aacf9a0f150a4c5b55a619c6d4a83d5b44672938f7";
    };
  };
  maven-plugin = mkJenkinsPlugin {
    name = "maven-plugin";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/maven-plugin/3.23/maven-plugin.hpi";
      sha256 = "f412f9701aafa46d8e68dccb046b41745f2116ad91b76b0f35a24f21830097eb";
    };
  };
  metrics = mkJenkinsPlugin {
    name = "metrics";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/metrics/4.2.21-449.v6960d7c54c69/metrics.hpi";
      sha256 = "296a4179040f0bf9390e6fdebef0c2dbb42083ab029a7b7f71698a90b7bb99e0";
    };
  };
  mina-sshd-api-common = mkJenkinsPlugin {
    name = "mina-sshd-api-common";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/mina-sshd-api-common/2.12.0-90.v9f7fb_9fa_3d3b_/mina-sshd-api-common.hpi";
      sha256 = "f29776326bf03b736e9da1a4385a2e9a5338b22ce9b9a4cbce0a4d547663806e";
    };
  };
  mina-sshd-api-core = mkJenkinsPlugin {
    name = "mina-sshd-api-core";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/mina-sshd-api-core/2.12.0-90.v9f7fb_9fa_3d3b_/mina-sshd-api-core.hpi";
      sha256 = "53506787ee5381ce1e303f9ad7a03b3a1a43cd545c9bb08e7b404fc786fb8663";
    };
  };
  node-iterator-api = mkJenkinsPlugin {
    name = "node-iterator-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/node-iterator-api/55.v3b_77d4032326/node-iterator-api.hpi";
      sha256 = "c9b2d8c7df2091a191f5562a35454ddc2343cfe9c274b1f6b5a83980f52b422f";
    };
  };
  okhttp-api = mkJenkinsPlugin {
    name = "okhttp-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/okhttp-api/4.11.0-172.vda_da_1feeb_c6e/okhttp-api.hpi";
      sha256 = "68195d6810ecabafd816c5ad6445418887693d7d5fd77f513796baaaf0b59330";
    };
  };
  parameterized-trigger = mkJenkinsPlugin {
    name = "parameterized-trigger";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/parameterized-trigger/787.v665fcf2a_830b_/parameterized-trigger.hpi";
      sha256 = "24cb0e52703f0a7df51e19fad5163fb39af3ab8dd7f2f05238c69824ddc0867c";
    };
  };
  pipeline-build-step = mkJenkinsPlugin {
    name = "pipeline-build-step";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-build-step/540.vb_e8849e1a_b_d8/pipeline-build-step.hpi";
      sha256 = "0a777f9282c726f5d254781eaacbdf2ceb813429b3d7ea54e0e739847f014b5a";
    };
  };
  pipeline-groovy-lib = mkJenkinsPlugin {
    name = "pipeline-groovy-lib";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-groovy-lib/704.vc58b_8890a_384/pipeline-groovy-lib.hpi";
      sha256 = "654825dc6b822c0c1948ee1a43675243b96ff30c0b08f13ac54295dead1d5437";
    };
  };
  pipeline-input-step = mkJenkinsPlugin {
    name = "pipeline-input-step";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-input-step/491.vb_07d21da_1a_fb_/pipeline-input-step.hpi";
      sha256 = "f4b1cb6a674f6afb70be197ae87fb3cfc613e30202f546a4f0bd4ae4be8b3a9d";
    };
  };
  pipeline-milestone-step = mkJenkinsPlugin {
    name = "pipeline-milestone-step";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-milestone-step/111.v449306f708b_7/pipeline-milestone-step.hpi";
      sha256 = "48bea7547ad989b0c1abb550c3e2ff27bb48d7ff7685e84c0f39d5148bf6fd6b";
    };
  };
  pipeline-model-api = mkJenkinsPlugin {
    name = "pipeline-model-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-model-api/2.2175.v76a_fff0a_2618/pipeline-model-api.hpi";
      sha256 = "c367a53635c4335f2dd4cc53dbe2309bed50a5b69f1b3d34e55b9879807ecc95";
    };
  };
  pipeline-model-definition = mkJenkinsPlugin {
    name = "pipeline-model-definition";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-model-definition/2.2175.v76a_fff0a_2618/pipeline-model-definition.hpi";
      sha256 = "c47b3bd40c132374ca6d8f0373d6f77bc4f03af75cb0a0766372bb57085ce08a";
    };
  };
  pipeline-model-extensions = mkJenkinsPlugin {
    name = "pipeline-model-extensions";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-model-extensions/2.2175.v76a_fff0a_2618/pipeline-model-extensions.hpi";
      sha256 = "feb61c6710d9c7ecbe0eecf4d59ff435b92e3cde3e6535c438ab96f2a9b5acf9";
    };
  };
  pipeline-stage-step = mkJenkinsPlugin {
    name = "pipeline-stage-step";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-stage-step/305.ve96d0205c1c6/pipeline-stage-step.hpi";
      sha256 = "8d5112dd70d9912f33bdb64858bbfa718372ab79447fa91f1e07fdb41c05bb7e";
    };
  };
  pipeline-stage-tags-metadata = mkJenkinsPlugin {
    name = "pipeline-stage-tags-metadata";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/pipeline-stage-tags-metadata/2.2175.v76a_fff0a_2618/pipeline-stage-tags-metadata.hpi";
      sha256 = "afc71f12887f4ec34ea27206f47372da08a9a466163970c2e314a235abb1df8f";
    };
  };
  plain-credentials = mkJenkinsPlugin {
    name = "plain-credentials";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/plain-credentials/143.v1b_df8b_d3b_e48/plain-credentials.hpi";
      sha256 = "23a74199dcb19659e19c9d92e4797b40bc9feb48400ce56ae43fa4d9520df901";
    };
  };
  plugin-util-api = mkJenkinsPlugin {
    name = "plugin-util-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/plugin-util-api/3.8.0/plugin-util-api.hpi";
      sha256 = "f65e67411075f72d713e6a616325eb3e883e824af99d6c64276cd52692b44444";
    };
  };
  prism-api = mkJenkinsPlugin {
    name = "prism-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/prism-api/1.29.0-10/prism-api.hpi";
      sha256 = "c76f5adc0cf0fdc71947126bd23b1b33b4a2dcf045204f294566de3f7eb74d20";
    };
  };
  promoted-builds = mkJenkinsPlugin {
    name = "promoted-builds";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/promoted-builds/945.v597f5c6a_d3fd/promoted-builds.hpi";
      sha256 = "0f4fe74153f4f1884d2babf249a967a0d162d75dc0d462af260ff50e5b9509d8";
    };
  };
  rebuild = mkJenkinsPlugin {
    name = "rebuild";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/rebuild/330.v645b_7df10e2a_/rebuild.hpi";
      sha256 = "1ca5eb17c5d19e1db6c9948c2e4f5bec0c717179210f12498b0920802bbc586e";
    };
  };
  run-condition = mkJenkinsPlugin {
    name = "run-condition";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/run-condition/1.7/run-condition.hpi";
      sha256 = "d8601f47c021f8c6b8275735f5c023fec57b65189028e21abac91d42add0be42";
    };
  };
  scm-api = mkJenkinsPlugin {
    name = "scm-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/scm-api/683.vb_16722fb_b_80b_/scm-api.hpi";
      sha256 = "6d37e2ff0f98f3dd1a843f1612a64bb08c398460b93c507d4d6c6f0020f78dc2";
    };
  };
  script-security = mkJenkinsPlugin {
    name = "script-security";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/script-security/1326.vdb_c154de8669/script-security.hpi";
      sha256 = "dff1a5b8aedf1f730ee3806cb3c2b0ef0b7e02673605f24fcd78439943ffd581";
    };
  };
  snakeyaml-api = mkJenkinsPlugin {
    name = "snakeyaml-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/snakeyaml-api/2.2-111.vc6598e30cc65/snakeyaml-api.hpi";
      sha256 = "11013a4ab9f8c93420ba6ec85faab53759ea8afd53ba2db3f97c0ed4f0ebe82b";
    };
  };
  ssh-credentials = mkJenkinsPlugin {
    name = "ssh-credentials";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/ssh-credentials/308.ve4497b_ccd8f4/ssh-credentials.hpi";
      sha256 = "23984ee5cfede3526a13714c82426db6d8e63c5635f9c6aac89a48c246000be2";
    };
  };
  ssh-slaves = mkJenkinsPlugin {
    name = "ssh-slaves";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/ssh-slaves/2.948.vb_8050d697fec/ssh-slaves.hpi";
      sha256 = "b5c14b5d4eadc28fa13c1f737f0b43d4a983c8b9e157f66f49c3c9ded93d7a66";
    };
  };
  structs = mkJenkinsPlugin {
    name = "structs";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/structs/337.v1b_04ea_4df7c8/structs.hpi";
      sha256 = "380f77f40d06174539410c04fcbc9ed12b7bd1f64775e58464233b489d6058ba";
    };
  };
  subversion = mkJenkinsPlugin {
    name = "subversion";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/subversion/2.17.3/subversion.hpi";
      sha256 = "e972712afe0225b4706e38b2352ae11c026b170cc023e68e40e87dfbd9c267a5";
    };
  };
  support-core = mkJenkinsPlugin {
    name = "support-core";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/support-core/1375.va_256158e8881/support-core.hpi";
      sha256 = "72328e2ca5556608d5f24ff2851ad4a1f091d2d81d217c9a1c61ee79bcc37d11";
    };
  };
  token-macro = mkJenkinsPlugin {
    name = "token-macro";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/token-macro/400.v35420b_922dcb_/token-macro.hpi";
      sha256 = "822726088a5893f248b7bba1aea92ef6df1534b64acc0a23e2fc976db33439c8";
    };
  };
  trilead-api = mkJenkinsPlugin {
    name = "trilead-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/trilead-api/2.133.vfb_8a_7b_9c5dd1/trilead-api.hpi";
      sha256 = "f68028aea9a0df8e984ff56ca0fc62cfdbbd24cc32c84070177348156693d8d6";
    };
  };
  variant = mkJenkinsPlugin {
    name = "variant";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/variant/60.v7290fc0eb_b_cd/variant.hpi";
      sha256 = "acbf1aebb9607efe0518b33c9dde9bd50c03d6a1a0fa62255865f3cf941fa458";
    };
  };
  vsphere-cloud = mkJenkinsPlugin {
    name = "vsphere-cloud";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/vsphere-cloud/2.27/vsphere-cloud.hpi";
      sha256 = "b584e8c515cdf41fa47740087677e11af80c402ef6c4fb5f153b9d8e05ccbdea";
    };
  };
  workflow-aggregator = mkJenkinsPlugin {
    name = "workflow-aggregator";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-aggregator/596.v8c21c963d92d/workflow-aggregator.hpi";
      sha256 = "45933e33058d48c6f3e70a37f31ecb65e48939ce91d46bc98b60f5595316c1d1";
    };
  };
  workflow-api = mkJenkinsPlugin {
    name = "workflow-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-api/1291.v51fd2a_625da_7/workflow-api.hpi";
      sha256 = "836d3ab116acb58fb75f295fb7f109674cfe9ad8d736f23fac94e6fc42f2f707";
    };
  };
  workflow-basic-steps = mkJenkinsPlugin {
    name = "workflow-basic-steps";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-basic-steps/1042.ve7b_140c4a_e0c/workflow-basic-steps.hpi";
      sha256 = "ab0f9d989a1885ae6f5148c9acc6ffcf1667bf427c6d392eaf8cf1cd1b670345";
    };
  };
  workflow-cps = mkJenkinsPlugin {
    name = "workflow-cps";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-cps/3853.vb_a_490d892963/workflow-cps.hpi";
      sha256 = "130331086e4760d59b1a9f6eba33d875d13af4e3d3de4da115a23f465f444511";
    };
  };
  workflow-durable-task-step = mkJenkinsPlugin {
    name = "workflow-durable-task-step";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-durable-task-step/1331.vc8c2fed35334/workflow-durable-task-step.hpi";
      sha256 = "adb54d564a54211aa10b413e3374ddad7822bf9cdaa868fe38bc417feebad20c";
    };
  };
  workflow-job = mkJenkinsPlugin {
    name = "workflow-job";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-job/1400.v7fd111b_ec82f/workflow-job.hpi";
      sha256 = "cad2dae02a386f98576e9f57f20c9040865e10177d6a5bce1b00e37dadce4324";
    };
  };
  workflow-multibranch = mkJenkinsPlugin {
    name = "workflow-multibranch";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-multibranch/783.va_6eb_ef636fb_d/workflow-multibranch.hpi";
      sha256 = "b0365b2a2286ad6c9f9fff160b9f736287f7549e19774c344d3ad0f9e74bb8ac";
    };
  };
  workflow-scm-step = mkJenkinsPlugin {
    name = "workflow-scm-step";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-scm-step/415.v434365564324/workflow-scm-step.hpi";
      sha256 = "500720bf8a634363c79ae16d56b88493c211fdb33e163b5d17fb52a85f53508e";
    };
  };
  workflow-step-api = mkJenkinsPlugin {
    name = "workflow-step-api";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-step-api/657.v03b_e8115821b_/workflow-step-api.hpi";
      sha256 = "02f581bac28571aa1059fa18cd270b86e1dce8b1b28db3283686196d4e8e318a";
    };
  };
  workflow-support = mkJenkinsPlugin {
    name = "workflow-support";
    src = fetchurl {
      url = "https://updates.jenkins-ci.org/download/plugins/workflow-support/865.v43e78cc44e0d/workflow-support.hpi";
      sha256 = "4a12fcb84863252e4d26198ce3b53bcdc66f25f1b54865e66be02d397ba001a0";
    };
  };
}
