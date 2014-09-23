aov.out = aov(Peak.Speed ~ participant* condition, data=master)
summary(aov.out)
