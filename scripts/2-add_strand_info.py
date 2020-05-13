# add strand info to the data

import sys
import os
import pandas as pd
import numpy as np

def add_columns(df, strand):
    '''
    add strand column and other needed columns to the df
    '''
    df['name'] = [strand + 'peak' + str(i) for i in range(df.shape[0])]
    df['score'] = '100'
    df['strand'] = strand
    return df

inpath = sys.argv[1]
opath = sys.argv[2]

if not os.path.exists(inpath):
    os.mkdir(inpath)

for filename in os.listdir(inpath):
    df = pd.read_csv(os.path.join(inpath, filename), names=['chr', 'strat', 'end'], sep='\t')

    if 'plus' in filename:
        add_columns(df, '+')
    else:
        add_columns(df, '-')
    
    df.to_csv(os.path.join(opath, filename), sep='\t', header=False, index=False)