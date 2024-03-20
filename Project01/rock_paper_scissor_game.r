game <- function() {
    user_name <- readline("What's your name: ")
    hands <- c("rock", "paper", "scissor")
    player_score <- 0
    comp_score <- 0

    while (TRUE) {
        bot_hands <- sample(hands, 1)
        player_hands <- readline("Choose your hands (rock, paper, scissor, quit): ")

        if (player_hands == "quit") {
            break
        }

        if (player_hands %in% hands) {
            cat("Computer chose:", bot_hands, "\n")

            if (player_hands == bot_hands) {
                cat("Tie!\n")
            } else if (
                (player_hands == "rock" && bot_hands == "scissor") ||
                (player_hands == "paper" && bot_hands == "rock") ||
                (player_hands == "scissor" && bot_hands == "paper")
            ) {
                cat("You Win!\n")
                player_score <- player_score + 1
            } else {
                cat("Not today\n")
                comp_score <- comp_score + 1
            }
        } else {
            cat("Invalid choice. Please enter 'rock', 'paper', 'scissor', or 'quit'.\n")
        }
    }

    total_scores <- sum(player_score)
    total_text <- paste("Your score:", total_scores, "\n")
    cat(total_text)
}
