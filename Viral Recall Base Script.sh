# Simple script for running viral recall on a genome


# "Use -i INPUT to list the input .fna file to be analzyed"
# "Next, use -p PROJECT to specify the project directory for the outputs
# "If you are using a database, use -db DATABASE to specify which Viral HMM database to use. Database options include "general" (general VOG db), "GVOG" (GVOG db), "marker" (for searching a set of 10 conserved NCLDV markers."
# "-w NUMBER specifies the sliding window size to use for detecting viral regions (default=15)"
# "-b [BATCH]implies the input is a folder of .fna files that each will be run iteratively"
# "use the flag -f to plot of the viral-like regions with the output



# "Example command: python viralrecall.py -i examples/arm29B.fna -p test_outdir -t 2 -f"
# just replace the input path for the fna sequence and output path
