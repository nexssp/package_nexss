const chdir = process.env.NEXSS_CWD + "/test.nexss/";
module.exports = {
  values: [".py"],
  tests: [
    {
      title: "Test for Error Handling in Nexss Programmer",
      chdir: chdir,
      tests: [
        {
          title: '${ext} - default resultField_1 - "nxsOut"',
          params: [
            `nexss nexssInOut.test.py bluesky worksgreat`,
            `"resultField_1":"nxsOut"`
          ]
        },
        {
          title: "${ext} Custom params",
          params: [null, `"nxsIn":["bluesky","worksgreat"]`]
        },
        {
          title: "nxsInAs",
          params: [
            "nexss nexssInOut.test${ext} --nxsInAs=start",
            /"nxsIn":[0-9],*/
          ]
        },
        {
          title: "nxsOutAs",
          params: [
            "nexss nexssInOut.test${ext} --nxsOutAs=bbbbb",
            /"nxsIn":[0-9],*/
          ]
        }
      ]
    }
  ]
};
