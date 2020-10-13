#include "3rdPartyLibraries/readStdin.c"
#include "3rdPartyLibraries/cjson/cJSON.c"
char *s_new_from_stdin(int beExact, size_t *len, size_t *size);

int main(void)
{
    int beExact = 0; // false
    size_t len = 0, size = 0;
    char *nexssStdin = s_new_from_stdin(beExact, &len, &size);
    if (!nexssStdin)
        puts("<NULL>");
    else
    {
        // puts(s);
        // printf("len: %zu, size: %zu\n", len, size);

        cJSON *nexssStdout = cJSON_Parse(nexssStdin);
        // int n = cJSON_GetArraySize(json);
        // arrayElement = cJSON_GetArrayItem(json, i);

        // READ DATA

        // cJSON * cwd = cJSON_GetObjectItem(json, "cwd");
        // printf("%s\n", cwd->valuestring);

        // if (cJSON_IsNumber(framerate_item))
        // {
        //     framerate = framerate_item->valuedouble;
        // }

        // Below not chaning - ADDING even second with the same key!!
        cJSON_AddItemToObject(nexssStdout, "helloFromC", cJSON_CreateNumber(__GNUC__));

        // cJSON_ReplaceItemInObject(nexssStdout, "helloFromC", cJSON_CreateNumber(__GNUC__));

        char *string = cJSON_PrintUnformatted(nexssStdout); // cJSON_PrintUnformatted

        puts(string);

        free(nexssStdin); // don't forget!
        cJSON_Delete(nexssStdout);
    }
    return 0;
}
