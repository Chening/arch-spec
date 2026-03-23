# arch-spec 完整实施计划

> 基于仓库现状分析制定。当前进度：1/20 篇已完成（0.1-craft-spectrum.html）。
> 制定日期：2026-03-23

---

## 一、现状评估

### 已完成
- [x] 系列北极星定义（`.ai/target-profiles.md`）
- [x] 设计系统文档（`.ai/style-guide.md`）
- [x] 20 篇文章完整地图（`plan/series-plan.html`）
- [x] 标准 CSS（`templates/article-base.css`）
- [x] 黄金模板文章 `0.1-craft-spectrum.html`
- [x] 目录结构搭建（L0-L4 文件夹）

### 待完成
- [ ] 19 篇文章内容（0.2 ~ 4.3）
- [ ] 80+ SVG 图表
- [ ] 配套 PPTX decks
- [ ] `.ai/prompts/` 目录下的生成提示词模板
- [ ] 文章间交叉引用系统

---

## 二、生产流水线（每篇文章的标准工序）

每篇文章从构思到发布遵循以下 7 步流水线：

```
Step 1  研究准备      → 精读源书清单，提取关键洞察与引用
Step 2  大纲起草      → 按六段骨架填充各节核心论点
Step 3  Hero Diagram  → 设计 §01 主图 SVG（CSS变量，800px宽）
Step 4  正文撰写      → 英文主论证 + 中文 .cn-note 蒸馏
Step 5  图表制作      → §03/§04/§05 所需的辅助 SVG 图表（3-5张）
Step 6  HTML 组装     → 内联 CSS，单文件自包含，响应式验证
Step 7  质量检查      → 六段完整性 / 双语覆盖 / SVG 变量 / 打印样式
```

---

## 三、分阶段实施路线图

### Phase 1：Code Craft 层（Month 1-2）— 3 篇待产

**目标**：完成 L0 全部 4 篇，建立内容生产节奏。

| 编号 | 标题 | 源书 | 核心交付 | 月份 |
|------|------|------|----------|------|
| 0.2 | AI-Era Refactoring | Refactoring, Legacy Code, Tidy First?, Code as Crime Scene | AI热点检测 + Strangler Fig加速 | M1 |
| 0.3 | Testing Strategies for Human + AI Codebases | TDD by Example, GOOS, Unit Testing | AI生成测试 + 变异测试复兴 | M2 |
| 0.4 | Developer's New Toolkit | Pragmatic Programmer, SW Eng at Google | MCP协议 + Claude Code无头管线 | M2 |

**关键依赖**：无外部依赖，0.1 已提供格式参考。
**风险点**：0.4 涉及 MCP/Claude Code 快速迭代中的技术细节，需要对齐最新文档。

---

### Phase 2：Design Thinking 层（Month 3-4）— 4 篇

**目标**：引入 DDD 和 API 设计，NRS 实战案例开始出现。

| 编号 | 标题 | 源书 | 核心交付 | 月份 |
|------|------|------|----------|------|
| 1.1 | Design Patterns Revisited | GoF, Head First, PoEAA | 23个GoF模式AI存活矩阵 + 5个AI原生模式 | M3 |
| 1.2 | DDD Meets AI | DDD (Evans), Implementing DDD, DDD Distilled | 限界上下文=AI服务边界 + NRS多国开票案例 | M3 |
| 1.3 | API Design as First-Class Decision | API Design Patterns, RESTful APIs, Building Microservices | OpenAPI=AI Prompt + NRS双凭证认证 | M4 |
| 1.4 | Error Handling & Observability | Release It!, Observability Eng, SRE Book | 信号架构 + AI异常检测 | M4 |

**关键依赖**：L0 概念作为基础，特别是 0.1 的代码成熟度模型。
**风险点**：1.2 NRS 多国案例需要真实业务上下文支撑。

---

### Phase 3：Architecture 层（Month 5-7）— 5 篇（最密集阶段）

**目标**：系列核心层，量化权衡与架构决策工程化。

| 编号 | 标题 | 源书 | 核心交付 | 月份 |
|------|------|------|----------|------|
| 2.1 | Architecture Styles Landscape | Fundamentals of SA, Hard Parts, Clean Arch | 2D风格地图 + AI Sidecar + Cell-Based | M5 |
| 2.2 | Distributed Data | DDIA, Database Internals, Hard Parts | AI辅助灾备决策 + NRS MySQL双城DR | M5 |
| 2.3 | Integration Patterns | EIP, Microservices Patterns | AI Schema映射 + NRS↔Bsale/Greece/Brazil | M6 |
| 2.4 | Saga Patterns | Hard Parts, Microservices Patterns, EIP | 8种Saga模式 + AI Saga监控 | M6 |
| 2.5 | Security Architecture | OAuth 2, API Security, Threat Modeling | AI威胁建模 + Prompt Injection防御 | M7 |

**关键依赖**：重度依赖 L0（代码质量）和 L1（模式/DDD）。
**风险点**：5 篇 3 个月，节奏最紧。2.2 和 2.3 的 NRS 真实架构图需要准确。

---

### Phase 4：Infrastructure 层（Month 7-9）— 4 篇

**目标**：将架构决策落地到自动化基础设施。

| 编号 | 标题 | 源书 | 核心交付 | 月份 |
|------|------|------|----------|------|
| 3.1 | CI/CD as Architecture | Continuous Delivery, Accelerate, SW Eng at Google | GitLab+Claude Code 4模式 + 夜间AI审计 | M7 |
| 3.2 | DNS & Network for Multi-DC | SRE Book, SRE Workbook, Release It! | CoreDNS/VRRP双DC + AI流量路由 | M8 |
| 3.3 | Infrastructure as Code | IaC (Morris), Terraform, K8s in Action | 意图驱动基础设施 + AI漂移检测 | M8 |
| 3.4 | Observability Stack | Observability Eng, Distributed Observability, SRE | NL日志分析 + AI Runbook生成 | M9 |

**关键依赖**：交叉引用 L2 架构决策。3.1 是 L2→L3 的桥梁文章。
**风险点**：3.2 CoreDNS/VRRP 技术细节需要验证。

---

### Phase 5：Engineering Culture 层（Month 9-10）— 3 篇

**目标**：收束全系列，从技术升维到组织与个人。

| 编号 | 标题 | 源书 | 核心交付 | 月份 |
|------|------|------|----------|------|
| 4.1 | Lean Engineering Manifesto | Accelerate, Toyota Way, Phoenix/Unicorn Project | 人×机能力矩阵 + OVP协议 | M9 |
| 4.2 | Team Topologies for AI Orgs | Team Topologies, Manager's Path, Elegant Puzzle | AI平台团队 + Conway定律AI时代 | M10 |
| 4.3 | Personal Knowledge System | Pragmatic Programmer, Staff Engineer, 201 Principles | 知识技能树 + 本系列作为RAG KB | M10 |

**关键依赖**：综合引用全部前序层。4.3 是元文章，回顾整个系列构建过程。
**风险点**：4.1 涉及 Gartner 2030 预测，需确保引用时效性。

---

## 四、图表生产策略

全系列预计 80+ SVG 图表，按类型分为：

| 图表类型 | 数量估计 | 模式 | 示例 |
|---------|---------|------|------|
| Hero Diagram（主图）| 20 | 每篇 1 张 | 0.1 的六阶段工艺光谱 |
| AI Co-Evolution 图 | 40+ | 每篇 2-3 张 | 经典→AI扩展的对比流程图 |
| 决策表配图 | 10+ | 按需 | 场景对比矩阵 |
| 架构拓扑图 | 10+ | L2/L3专属 | NRS 双城 DR 拓扑 |

**SVG 规范**：
- 使用 CSS 自定义属性 + fallback：`fill="var(--bg-card,#141b2d)"`
- ViewBox 宽度 ~800px
- 字体：`font-family:'JetBrains Mono',monospace`
- 独立 SVG 同步导出到 `diagrams/` 目录

---

## 五、交叉引用与连贯性系统

### 文章间引用规则
1. **前向引用**：§06 Architect's Takeaway 预告下一篇
2. **回向引用**：§02/§03 中引用前序文章的已建立概念
3. **跨层引用**：高层文章（L2+）引用低层具体段落
4. **Running Example 贯穿**：NRS 多国开票平台作为 L1-L3 的统一案例

### 术语一致性
- 首次出现的专有术语在首篇中定义
- 后续文章直接使用，不重复解释
- 考虑在 `.ai/` 下建立 `glossary.md` 作为统一术语表

---

## 六、质量检查清单（每篇发布前）

```
□ 六段骨架完整（§01-§06 均存在且不为空）
□ 源书 book-card 数量 = 3-4
□ AI Co-Evolution 角度 = 4 个
□ 决策表行数 ≥ 6
□ 检查表条目 ≥ 10，标注成熟度阶段
□ 每个英文段落后有 .cn-note
□ 表格和代码块仅英文
□ 所有 SVG 使用 CSS 变量 + fallback
□ 内联 CSS 来自 article-base.css
□ 单文件 HTML，无外部依赖（除 Google Fonts）
□ 打印样式测试通过
□ 移动端响应式 ≤ 768px 验证
□ §06 包含下一篇预告
□ 文件保存至正确目录 articles/L{n}-{name}/
```

---

## 七、工具链与基础设施改进建议

### 近期可落地
1. **生成提示词模板**：在 `.ai/prompts/` 创建每篇文章的生成提示模板，包含源书列表、AI角度、NRS案例要求
2. **术语表**：`.ai/glossary.md`，全系列统一术语
3. **进度追踪**：在 `plan/series-plan.html` 中为已完成文章添加 `tag-done` 标记

### 中期可优化
4. **CSS 热更新验证**：构建一个简易本地预览脚本，修改 `article-base.css` 后验证全部已有文章的渲染
5. **SVG 模板库**：为常见图表类型（对比图、流程图、矩阵图）创建 SVG 模板
6. **自动化质量检查**：脚本验证六段骨架完整性、.cn-note 覆盖率、SVG 变量使用

---

## 八、优先级建议与执行节奏

### 下一步行动（立即）
1. **产出 0.2 AI-Era Refactoring** — L0 层的第二篇，源书明确，与 0.1 形成天然延续
2. 同步建立 `.ai/prompts/article-generation.md` 提示词模板

### 每月节奏
- 每月目标 2 篇
- 上半月：研究 + 大纲 + Hero Diagram
- 下半月：正文 + 辅助图表 + HTML组装 + 质检

### 里程碑
| 里程碑 | 时间 | 标准 |
|--------|------|------|
| L0 完成 | M2 结束 | 4 篇全部通过质量检查 |
| L0+L1 完成 | M4 结束 | 8 篇 + NRS案例首次贯穿 |
| L2 完成（系列核心）| M7 前半 | 13 篇 + 架构决策表完备 |
| L3 完成 | M9 前半 | 17 篇 + CI/CD实战集成 |
| 全系列完成 | M10 结束 | 20 篇 + 交叉引用完备 + 4.3 元回顾 |

---

## 九、风险登记

| 风险 | 影响 | 缓解措施 |
|------|------|---------|
| Phase 3 节奏过紧（5篇/3月）| 质量下降 | 2.3/2.4 可并行（互不依赖），提前启动 2.1 大纲 |
| NRS 案例真实性不足 | 读者信任度降低 | 确保每个 NRS 案例有真实技术决策背景 |
| AI 工具链快速迭代 | 0.4/3.1 技术细节过时 | 这两篇安排在发布前做最终技术校准 |
| CSS 修改影响已有文章 | 视觉不一致 | 建立修改 article-base.css 后的回归检查流程 |
| 跨文章引用断裂 | 阅读体验碎片化 | 每完成一个 Phase 做全量交叉引用审查 |
