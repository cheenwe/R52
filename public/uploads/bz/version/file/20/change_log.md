# History

## 项目工单

### 1101 
1.列表页面区域不显示, ok 
1.1. 添加研发支持人员,算法支持人员  ok 
2.进展阶段分为研发阶段和商务阶段 ok
3.车检项目添加照片通过率和整车通过率要求; 是否大车,  是否视频 ok
4.持续计算每个阶段持续时间, 统计报表 rails g scaffold property_period property_id:integer property_type:string  record_id:integer record_type:string  period:float  ok
5.工单类型处理中,等状态, 计算耗时  同 4
6. 添加 3 中实测指标及版本号 
7.在处理人直接修改,  显示技术支持人员日历视图
8.工单预警机制,  2 天的 1/2 预警, 超期预警   4

    2 4  1/2 预警
    6 9   /3 预警
    > 10  /4 预警


