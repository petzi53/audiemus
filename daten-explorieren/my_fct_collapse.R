### collapse levels of item battery
### This function could be mor general if I would add additional parameters in the call
### Each of this parameter is a list of two string vectors
### the first one is the new (summarised) level,
### the other one is a string vector of levels to collapse
my_fct_collapse <- function(df)
        # df = data frame of factors
        # that has to match exactly the levels of function fct_collapse
        {
        j = ncol(df)
        for (i in 1:j) {
                df[[i]] <- fct_collapse(df[[i]],
                                        "trifft zu" = c("trifft voll zu",
                                                        "trifft weitgehend zu",
                                                        "trifft überwiegend zu"),
                                        "trifft nicht zu" = c("trifft eher nicht zu",
                                                              "trifft gar nicht zu"))
        }
        df
}

# example for call
# wunsch.rec0 <- my_fct_collapse(wunsch)
