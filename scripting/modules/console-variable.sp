static ConVar g_bonusRound;

void Variable_Create() {
    g_bonusRound = CreateConVar("sm_mutualscore_bonus_round", "0", "Count the kills in the bonus round");
}

bool Variable_BonusRound() {
    return g_bonusRound.BoolValue;
}
