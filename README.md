# SkyLabSwift
Swift 版 iOS A/B 测试

# 参考

Mattt 大神的 [SkyLab](https://github.com/mattt/SkyLab)

# 待改进

因为现在还没涉及 多变量测试，所以 conditions 参数设计，没有像 Mattt 大神考虑的那么全面，不过，我后来思考了一下，稍微改写一下，应该也能满足，大概是这样吧

```
static func splitTest<T:Collection>(with name: String, conditions: T, closure: (String) -> Void)
```
等涉及到的时候我再进行改进～
