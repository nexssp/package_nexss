const { join } = require("path");
const languages = require(join(
  process.env.NEXSS_SRC_PATH,
  "nexss-language",
  "repos.json"
));

let values = Object.keys(languages);

const chdir = process.env.NEXSS_CWD + "/test.nexss/";

module.exports = {
  values: [".py", ".js", ".ps1"],
  testsSelect: [1, 2],
  startFrom: null, // eg. .cs
  endsWith: null, // eg .cs
  omit: [],
  tests: [
    {
      title: "Test for Log messages in Nexss Programmer",
      tests: [
        {
          title: "Test of nxsInfo for extension: ${ext}",
          params: [
            "nexss nexssLog.test${ext}",
            "Nexss info message",
            {
              chdir: chdir
            }
          ]
        },
        {
          title: "Test of nxsWarn for extension: ${ext}",
          params: [
            null,
            "Nexss warn message",
            {
              chdir: chdir
            }
          ]
        },
        {
          title: "Test of nxsOk for extension: ${ext}",
          params: [
            null,
            "Nexss ok message",
            {
              chdir: chdir
            }
          ]
        },
        {
          title: "Test of nxsError for extension: ${ext}",
          params: [
            null,
            "Nexss error message",
            {
              chdir: chdir
            }
          ]
        }
      ]
    }
  ]
};
