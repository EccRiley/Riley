Rsave_kable <- function(x, file, print_x = TRUE, ...) {
	require(kableExtra)
    if (print_x) {
        print(x)
    }
    kableExtra::save_kable(x = x, file = file)
}
