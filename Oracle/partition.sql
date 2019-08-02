--- oracle partition by
一、Oracle分区简介
ORACLE的分区是一种处理超大型表、索引等的技术。分区是一种“分而治之”的技术，通过将大表和索引分成可以管理的小块，从而避免了对每个表作为一个大的、单独的对象进行管理，为大量数据提供了可伸缩的性能。分区通过将操作分配给更小的存储单元，减少了需要进行管理操作的时间，并通过增强的并行处理提高了性能，通过屏蔽故障数据的分区，还增加了可用性。
二、Oracle分区优缺点
优点：
增强可用性：如果表的某个分区出现故障，表在其他分区的数据仍然可用；
维护方便：如果表的某个分区出现故障，需要修复数据，只修复该分区即可；
均衡I/O：可以把不同的分区映射到磁盘以平衡I/O，改善整个系统性能；
改善查询性能：对分区对象的查询可以仅搜索自己关心的分区，提高检索速度。
缺点：
分区表相关：已经存在的表没有方法可以直接转化为分区表。不过 Oracle 提供了在线重定义表的功能。
三、Oracle分区方法
范围分区：
范围分区就是对数据表中的某个值的范围进行分区，根据某个值的范围，决定将该数据存储在哪个分区上。如根据序号分区，根据业务记录的创建日期进行分区等。
Hash分区（散列分区）：
散列分区为通过指定分区编号来均匀分布数据的一种分区类型，因为通过在I/O设备上进行散列分区，使得这些分区大小一致。
List分区（列表分区）：
当你需要明确地控制如何将行映射到分区时，就使用列表分区方法。与范围分区和散列分区所不同，列表分区不支持多列分区。如果要将表按列分区，那么分区键就只能由表的一个单独的列组成，然而可以用范围分区或散列分区方法进行分区的所有的列,都可以用列表分区方法进行分区。
范围-散列分区（复合分区）：
有时候我们需要根据范围分区后，每个分区内的数据再散列地分布在几个表空间中，这样我们就要使用复合分区。复合分区是先使用范围分区，然后在每个分区内再使用散列分区的一种分区方法（注意：先一定要进行范围分区）
范围-列表分区（复合分区）：
范围和列表技术的组合，首先对表进行范围分区，然后用列表技术对每个范围分区再次分区。与组合范围-散列分区不同的是，每个子分区的所有内容表示数据的逻辑子集，由适当的范围和列表分区设置来描述。（注意：先一定要进行范围分区） 
