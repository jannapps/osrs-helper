# osrs-helper

Yet another helper web app for Old School RuneScape with an emphasis on predicting profitability and XP rates for fun activities as opposed to more optimal activities (as defined by oldschool.runescape.wiki).

## Note
This project is mostly an experiment in vibecoding. Please do not mistake any of what it contains as the handmade work or writing of the author, including the rest of the content of this readme.

## About

This web app ~~is~~ will be designed to address a gap in the existing tools available for Old School RuneScape players. Current tools often make rigid assumptions about how players engage with the game, which can lead to suboptimal or unrealistic recommendations, or worse, a player becoming extremely bored. This project aims to provide a more flexible and nuanced approach to evaluating profitability and XP rates for various game activities.

### Example Use Case

Consider a scenario where you're training your Farming skill and want to make some money at the same time. You might:

1. Buy Ranarr Seeds and Snape Grass Seeds from the Grand Exchange (GE).
2. Plant and harvest them.
3. Process the harvested Ranarr Weed and Snape Grass into Prayer Potions.

Existing tools assume you'll sell the harvested crops immediately on the GE, but this approach overlooks potential profit and Herblore XP from processing the ingredients, even if it's technically less efficient in terms of XP/hr or GP/hr. Additionally:

- Snape Grass has a higher yield than Ranarr Weed, leading to excess Snape Grass.
- You could either sell the extra Snape Grass or purchase more Ranarr Weed to process it into additional Prayer Potions.

This tool will help answer questions like:
- Which is more profitable: selling the extra Snape Grass or purchasing more Ranarr Weed (or Unfinished Ranarr Potions) to process it?
- How do the costs of seeds and the yield ratios affect profitability?
- How comparable are the XP/hr rates for any given production chain when compared to the "optimal" rate? 

### Features

- **Freedom in Playstyle**: Unlike existing tools, this app makes no assumptions about how you play the game.
- **Profitability Analysis**: Evaluate the profitability of processing materials versus selling them directly.
- **Production Chain Mapping**: Plan and visualize your production chains to determine the most efficient or profitable workflows.
- **API Integration**: Connects with APIs from both major GE price sites to track the profitability of your activities in real time.

This tool aims to provide a more player-centric approach to decision-making in Old School RuneScape, helping you maximize both your enjoyment and efficiency.
