; fast syntax highlight theme spa
; 144, 187, 110, 203
[base]
default          = none
unknown-token    = 196
commandseparator = 150
redirection      = none
here-string-tri  = yellow
here-string-text = bg:19
here-string-var  = 186,bg:19
exec-descriptor  = yellow,bold
comment          = black,bold
correct-subtle   = bg:55
incorrect-subtle = bg:52
subtle-bg        = bg:17
secondary        = zdharma
recursive-base   = 183

[command-point]
reserved-word  = 144
subcommand     = 144
alias          = 187
suffix-alias   = 187
global-alias   = bg:19
builtin        = 150
function       = 187
command        = 187
precommand     = 187
hashed-command = 187
single-sq-bracket = 150
double-sq-bracket = 150
double-paren   = 144

[paths]
path          = 110
pathseparator = 
path-to-dir   = 110,underline
globbing      = 220
globbing-ext  = 225

[brackets]
paired-bracket = bg:blue
bracket-level-1 = 115
bracket-level-2 = 177
bracket-level-3 = 220

[arguments]
single-hyphen-option   = 185
double-hyphen-option   = 185
back-quoted-argument   = none
single-quoted-argument = 110
double-quoted-argument = 110
dollar-quoted-argument = 110

[in-string]
; backslash in $'...'
back-dollar-quoted-argument           = 186
; backslash or $... in "..." (i.e. variable in string)
back-or-dollar-double-quoted-argument = 186

[other]
variable             = none
assign               = none
assign-array-bracket = 187
history-expansion    = blue,bold

[math]
mathvar = 150
mathnum = 110
matherr = 196

[for-loop]
forvar = 71
fornum = 110
; operator
foroper = 203
; separator
forsep = 147

[case]
case-input       = 187
case-parentheses = 116
case-condition   = bg:19
