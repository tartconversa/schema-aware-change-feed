# 岗位库变更订阅的跨模式接续

各记录目录保存独立的合成业务资料。SQL 文件仅包含原始关系表与已有行。manifest.json 记录库角色、表、行数及运行参数。timeline.json 记录后续客户端行为、来源提交或故障，用 pos 表示可比较的到达次序。同一 pos 按数组顺序。提交位置由相应记录的业务字段指定。

## 接入协议

源日志记录按位点排列。begin、row、ddl、commit 和 rollback 以 tx 同组，允许不同事务记录交错。commit 的位置是消费凭据确认单位；正文 last_transaction 为空时为订阅尚未应用完整事务。初始 jobs_base 对应 source_cut。变更的 before/after 自行带完整逻辑列，schema 表明该行实际编码。一个岗位在活动范围可以有多个地点。legacy 使用 site_code，current 使用按有效期生效的 locations；旧模式只有一个无独立有效期的地点才能等价表达。
订阅范围按 district 和岗位类别判断，对内容转出范围的订阅可消费针对旧键的删除。每个订阅有独立代次 generation；连接建立及已确认位置来自 timeline，不是数据库准备时已应用的操作。

## 本地资料

使用 Python 3.11.2 和内置 SQLite 3.40.1。以下命令从记录创建关系库，目标文件需要尚不存在。各角色可以作为独立 SQLite 文件读取。

~~~sh
python3 seed_db.py fixtures/ddl-and-key-change-at-snapshot-edge main-local.db --role main
~~~

使用 Python 的 sqlite3 打开新文件即可访问原始表。用 python3 -m unittest -v 核对资料可装载、表与原始记录一致、SQLite 可同时打开读写连接。后续事件保存在各自的原始记录中。
