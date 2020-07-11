# AutoPrint written in Nexss Programmer

## Install

## Setup

Create your json config file, by copy `autoprint.config.template.json` and save as `autoprint.config.json`.

## Execution

```sh
nexss autoPrint.nexss
```

## Notes

Program sets which email should be printed next in the file `nexssStorage.json`

Below - so in the next run it will run from the number 13

```json
{ "emailLastUID": "13" }
```

Check emails from id 10 like this. (note: You need to be in folder of this example. This is run of another displayEmails.nexss file.)

```sh
nexss .\displayEmails.nexss --emailSearch=10
```
