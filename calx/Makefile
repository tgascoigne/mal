export CALXPATH := "../../calx"

#####################

SOURCES_BASE =
SOURCES_LISP =
SOURCES =

#####################

SRCS = step0_repl.cl step1_read_print.cl
BINS = $(SRCS:%.cl=%)

#####################

all: $(BINS)

dist: mal

mal: $(word $(words $(BINS)),$(BINS))
	cp $< $@

define dep_template
$(1): $(SOURCES_BASE) src/$(1)/$(1).cl
	calxcc -I $(CALXPATH)/std -runtime $(CALXPATH)/runtime -o $(1) -v 2 src/$$@
endef

$(foreach b,$(BINS),$(eval $(call dep_template,$(b))))

clean:
	rm -f $(BINS) mal

.PHONY: stats stats-lisp

stats: $(SOURCES)
	@wc $^
	@printf "%5s %5s %5s %s\n" `grep -E "^[[:space:]]*//|^[[:space:]]*$$" $^ | wc` "[comments/blanks]"
stats-lisp: $(SOURCES_LISP)
	@wc $^
	@printf "%5s %5s %5s %s\n" `grep -E "^[[:space:]]*//|^[[:space:]]*$$" $^ | wc` "[comments/blanks]"
