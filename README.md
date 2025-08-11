# Predictive Modeling of Baby & Maternity Health Impacts on Infant Growth

## 📌 Overview
This project investigates the relationship between mothers’ physical and psychological health and the behavioral and sleep patterns of their infants. Using real survey data from 390 mother–infant pairs, we apply statistical analysis, machine learning, and optimization to predict infant outcomes and design cost-effective intervention plans.  
> This work was awarded the **Meritorious Award** in the *2023 Huashu Cup National Undergraduate Mathematical Modeling Competition*.

## 📂 Contents
- **Data preprocessing**: Outlier detection, variable transformation, normalization.
- **Statistical analysis**: Correlation–significance testing (Spearman, Chi-square, ANOVA).
- **Machine learning**: Random Forest classification, class balancing via under/over-sampling.
- **Dimensionality reduction**: Principal Component Analysis (PCA).
- **Predictive modeling**: Multinomial Logistic Regression for behavior and sleep quality prediction.
- **Optimization**: Exhaustive search + cost model for treatment strategy optimization.

## 📊 Methodology
1. **Data Cleaning & Transformation**
   - Outlier replacement for sleep time & marital status.
   - Direction unification (positive/negative indicators) & Min–Max normalization.
   - Encoding categorical variables for model compatibility.

2. **Exploratory Statistical Analysis**
   - Tested normality of continuous variables (Jarque–Bera, Q–Q plots).
   - Correlation–significance testing to identify key predictors.

3. **Behavior Prediction (Problem 2)**
   - Built a Random Forest model (100 trees) achieving **54%** accuracy after balancing classes.
   - Applied PCA to reduce 8 indicators to 5 principal components (84.7% cumulative variance).
   - Logistic Regression achieved **70.3%** accuracy for behavior type prediction.

4. **Treatment Cost Optimization (Problem 3 & 5)**
   - Modeled treatment cost as a linear function of CBTS, EPDS, HADS score reduction.
   - Exhaustive search across 6,992 possible score-reduction combinations.
   - Found minimal-cost solutions for converting behavior types while improving sleep quality.

5. **Sleep Quality Prediction (Problem 4)**
   - Rated sleep quality into four levels (Poor, Medium, Good, Excellent) using Rank-Sum Ratio (RSR) method.
   - Logistic Regression model achieved **75.6%** accuracy.

## 📈 Key Results
- Psychological indicators (CBTS, EPDS, HADS) have a stronger influence on infant sleep quality than physical indicators.
- Optimal treatment for Case #238 (conflict-type behavior → moderate-type) costs **¥3,085**.
- Achieving both improved behavior and excellent sleep quality requires tailored reduction strategies.

## 🛠️ Reproducibility
**Requirements**
```bash
MATLAB R2022b or later
Excel / CSV data files
