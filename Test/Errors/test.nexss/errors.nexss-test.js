module.exports = {
  tests: [
    {
      title: "Test for Error Handling in Nexss Programmer",
      tests: [
        {
          title: "Check for OK message",
          params: [
            "nexss Nexss/Test/Errors",
            "Error 1/2 from file 1: Standard STDERR"
          ]
        },
        {
          title: "Check for warning message",
          params: [null, "Warning from file (Between erros No 1/2 and 2/2)"]
        },
        {
          title: "Check for warning message",
          params: [null, "Error 2/2 from file 1: Standard STDERR"]
        },
        {
          title: "NexssStdin should not be there",
          type: "shouldNotContain",
          params: ["nexss Nexss/Test/Errors", "NexssStdin"]
        }
      ]
    }
  ]
};
