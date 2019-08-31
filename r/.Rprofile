local({
    r <- getOption("repos")
    r["CRAN"] <- "http://cran.revolutionanalytics.com"
    options(repos = r)
})

options(prompt="λ ")
options(continue="    … ")

options("digits.secs" = 3)
options(browserNLdisabled = TRUE)
options(editor = "vim")
options(error = NULL)
options(max.print = 100)
options(max.print = 500)
options(menu.graphics = FALSE)
options(scipen = 10)
options(show.signif.stars = FALSE)
options(showErrorCalls = TRUE)
options(showWarnCalls = TRUE)
options(stringsAsFactors = FALSE)
options(warn = 0)
options(warnPartialMatchDollar = TRUE)
options(width = 80)

q <- function (save = "no", ...)
    quit(save = save, ...)

utils::rc.settings(ipck = TRUE)

.First <- function()
{
    if (interactive())
    {
        library(utils)
        timestamp(prefix = paste("##------ [", getwd(), "] ", sep = ""))
    }
}

.Last <- function()
{
    if (interactive())
    {
        hist_file <- Sys.getenv("R_HISTFILE")
        if (hist_file == "")
            hist_file <- "~/.RHistory"
        savehistory(hist_file)
    }
}

if (Sys.getenv("TERM") == "xterm-256color")
    library("colorout")

.env <- new.env()

.env$unrowname <- function(x)
{
    rownames(x) <- NULL
    x
}

.env$unfactor <- function(df)
{
    id <- sapply(df, is.factor)
    df[id] <- lapply(df[id], as.character)
    df
}

attach(.env)

# vim: filetype=r
