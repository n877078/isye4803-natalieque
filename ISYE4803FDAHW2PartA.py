import pandas as pd
import numpy as np
import statsmodels.api as sm

df = pd.read_csv("roe01.txt", sep=r"\s+")

# Column means
means = df.mean()
print(means)

# Correlation
print(df["ROEt"].corr(df["ROE"]))
corr_matrix = df.corr()
print(corr_matrix.round(3))

# Linear model
X = df[["ATO","PM","LEV","GROWTH","PB","ARR","INV","ASSET","ROE"]]
X = sm.add_constant(X)
y = df["ROEt"]

model = sm.OLS(y, X).fit()
print(model.summary())