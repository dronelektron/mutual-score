void Menu_AddToPreferences() {
    SetCookieMenuItem(MenuHandler_ShowScore, 0, SHOW_MUTUAL_SCORE);
}

public void MenuHandler_ShowScore(int client, CookieMenuAction action, any info, char[] buffer, int maxLength) {
    if (action == CookieMenuAction_SelectOption) {
        Cookie_ToggleValue(client);
        ShowCookieMenu(client);
    } else {
        bool enabled = Cookie_IsShowScore(client);

        SetGlobalTransTarget(client);
        FormatEx(buffer, maxLength, "%t [ %t ]", SHOW_MUTUAL_SCORE, enabled ? ITEM_ENABLED : ITEM_DISABLED);
    }
}
