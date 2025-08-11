# Mom & Baby Pricing & Restock Optimization
**母婴用品定价与补货优化（Huashu Cup 项目复现 + 增强版）**

> ARIMA + 回归/多项式拟合 + 非线性规划 + 粒子群算法（PSO）  
> 目标：一周滚动周期内，在保质期短/损耗高/SKU约束下最大化利润的定价与补货联合决策。

![Python](https://img.shields.io/badge/Python-3.10+-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-green)
![Build](https://img.shields.io/badge/Status-Research%20Prototype-orange)

## 1. 背景
母婴类产品存在保质期短、需求波动强、对缺货敏感等特性。我们基于竞赛论文（华数杯）的方法，将“蔬菜场景”迁移为“母婴用品”场景，构建端到端的 **预测→规划→优化** 流水线。

## 2. 方法概览
- **EDA**：销量/价盘/退货与损耗分布、季节性/节假日效应、品类/SKU关联（K-S、Pearson）
- **预测**：ARIMA/Auto-ARIMA 进行短期成本/销量先验预测
- **回归拟合**：价格-销量曲线多项式拟合（并保留更稳健的替代，如局部回归/样条）
- **非线性规划（NLP）**：利润最大化，约束含：进货量、损耗率、SKU数/陈列容量、最低边际、服务水平
- **PSO 优化**：在复杂/非凸情形下全局搜索 7 天联合策略，补足 NLP 对非凸/离散约束的不足
- **数据增强建议**：用户画像、竞品供给、库存实测、上游供给质量/距离、舆情/热点

## 3. 目录结构
