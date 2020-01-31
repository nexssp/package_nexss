const { normalize } = require("path");

let values = ["Nexss Errors"];

module.exports = {
  values,
  testsSelect: [1, 2],
  startFrom: "",
  endsWith: "",
  omit: [],
  tests: [
    {
      title: "Errors Solutions",
      tests: [
        {
          title: "Check Capturing Group (*.?)",
          params: [
            "nexss src/errors1.js",
            "Define 'testNotExistVariable2' before you use it.",
            {
              chdir: process.env.NEXSS_CWD
            }
          ]
        },
        {
          title: "Check Named Group (?<found1>.*?)",
          params: [
            `nexss src/errors2.js`,
            "Possible solution 1: Define 'DefineBeforeUseVar' before you use it",
            {
              chdir: process.env.NEXSS_CWD
            }
          ]
        },
        {
          title: "Check String Solution",
          params: [
            `nexss src/errors3.js`,
            "Possible solution 1: Did you forget semi-color ';' ?",
            {
              chdir: process.env.NEXSS_CWD
            }
          ]
        }
      ]
    }
  ]
};
