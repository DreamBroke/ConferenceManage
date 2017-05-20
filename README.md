# ConferenceManage

这是一个使用javaweb实现的会议信息管理项目的前端网页部分，其中数据库连接配置在src/dbconfig中。
各表格意义如下：
注：部分属性与实际数据库可能存在不一致的情况，请以数据库为准。


名称：会议基本信息表（conference）                    编号：D001
简述：会议基本信息
去向：会议基本信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
con_no	N	数值		会议编号，每个会议的编号是唯一的，系统自动生成
con_name	N	字符	32	会议名
con_host	Y	字符	32	主办单位
con_organizer	Y	字符	32	承办单位
con_co-organizer	Y	字符	32	协办单位
con_startdate	N	日期时间		会议开始日期
con_enddate	N	日期时间		会议结束日期
con_upstartdate	N	日期时间		论文提交开始时间
con_upenddate	N	日期时间		论文提交截止时间
con_address	Y	TEXT		会议报到地点
con_contents	N	TEXT		会议主要内容
con_affair-linkman	Y	数值		会务联系人职工号
con_finance-linkman	Y	数值		财务联系人职工号
con_capital	Y	TEXT		缴费详情（作废属性）
con_repast	Y	TEXT		就餐安排
con_scopen	Y	TEXT		投稿指南


名称：日程表（schedule）                              编号：D002
简述：会议日程信息
去向：会议日程管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
sche_no	N	数值		日程编号，每个日程的编号是唯一的，系统自动生成
sche_date	N	日期时间		日程日期
sche_starttime	N	日期时间		日程开始时间
sche_endtime	N	日期时间		日程结束时间
sche_speaker	Y	数值		报告人编号
sche_content	Y	TEXT		日程内容
sche_address	Y	TEXT		日程举行地点
sche_category	N	字符	10	日程类别


名称：论文状态表（condition）                         编号：D003
简述：存储论文状态的表，如审核中、未通过、审核通过等
去向：论文审核管理、论文状态管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
cond_no	N	数值		论文状态编号，每篇论文状态的编号是唯一且由系统自动生成
cond_name	N	字符	10	论文状态名
cond_createtime	N	日期时间		表示该条记录的创造时间
cond_createman	N	数值		表示该条记录的创造人编号


名称：参会代表表（representor）                        编号：D004
简述：参会代表信息
去向：注册、登录、代表个人信息管理、个人论文管理、预订酒店管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
rep_no	N	数值		代表编号，每个代表的编号是唯一的，系统自动生成
rep_username	N	字符	15	登录的用户名
rep_password	N	字符	15	登录的密码
rep_name	N	字符	20	姓名
rep_sex	N	字符	2	性别
rep_position	Y	字符	10	职位
rep_professional	N	数值		职称
rep_taxpay	Y	字符	20	纳税人识别号
rep_company	Y	字符	50	工作单位
rep_email	Y	字符	20	电子邮箱
rep_tel	Y	字符	15	电话号码
rep_country	Y	字符	20	国籍（作废属性）
rep_province	Y	字符	20	省份（作废属性）
rep_city	Y	字符	20	城市（作废属性）
rep_postcode	Y	字符	10	邮编
rep_qq	Y	字符	12	QQ号码
rep_field	Y	TEXT		研究领域
rep_payment	N	数值		缴纳金
rep_IDnumber	Y	字符	18	身份证号码
rep_attend	N	数值		是否参加会议
rep_isexpert	N	数值		是否是专家


名称：论文表（dissertation）                           编号：D005
简述：参会代表提交的论文信息
去向：个人论文管理、论文审核管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
dis_no	N	数值		论文编号，每篇论文的编号是唯一且由系统自动生成
dis_title	N	字符	30	论文标题
dis_keyword	N	字符	30	关键词
dis_abstract	N	TEXT		摘要
dis_realm	N	数值		论文领域序号
dis_author	N	数值		论文上传者账户编号
dis_file	N	字符	20	论文上传的文件地址
dis_condition	N	数值		论文状态
dis_approver	N	数值		审稿人（作废属性）
dis_uptime	N	日期时间		上传时间
dis_apptime	Y	日期时间		审批时间


名称：领域表（realm）                                编号：D006
简述：存储论文和审核论文的职工所属于的领域信息的表
去向：职工信息管理、论文上传管理、领域信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
rea_no	N	数值		领域编号，每个领域的编号是唯一且由系统自动生成
rea_name	N	字符	20	领域名
rea_father	N	数值	30	父领域
rea_createtime	N	日期时间		创造时间
rea_createman	N	数值		创建人编号


名称：职工表（teacher）                              编号：D007
简述：职工信息表
去向：职工信息管理、论文审核管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
tea_no	N	数值		职工编号，每个职工的编号是唯一且由系统自动生成
tea_username	N	字符	20	职工账号登录的用户名
tea_password	N	字符	20	职工账号登录的密码
tea_name	N	字符	20	姓名
tea_sex	N	字符	2	性别
tea_position	Y	字符	20	职位
tea_professional	N	数值		职称
tea_email	Y	字符	20	电子邮箱
tea_tel	Y	字符	15	电话号码
tea_qq	Y	字符	12	QQ号码
tea_scope	N	数值		工作种类序号
tea_realm	N	数值		负责论文领域


名称：工作种类表（scope）                            编号：D008
简述：存储论文和审核论文的职工所属于的领域信息的表
去向：工种信息管理、职工信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
sco_no	N	数值		工种编号，每个工种的编号是唯一且由系统自动生成
sco_name	N	字符	20	工种名称
sco_jurisdiction	N	数值		工种权限
sco_brief	Y	TEXT		工作说明
sco_createtime	N	日期时间		创造时间
sco_createman	N	数值		创建人编号


名称：职称信息表（professional）                       编号：D009
简述：存储职工和参会代表职称信息的表
去向：职称信息管理、职工信息管理、代表信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
pro_no	N	数值		职称编号，每个职称的编号是唯一且由系统自动生成
pro_name	N	字符	20	职称名称
pro_createtime	N	日期时间		创造时间
pro_createman	N	数值		创建人编号


名称：权限信息表（jurisdiction）                       编号：D010
简述：存储职工可以拥有的权限的信息的表
去向：权限信息管理、职工信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
jur_no	N	数值		权限编号，每个权限的编号是唯一且由系统自动生成
jur_range	N	数值		权限值
jur_instruction	N	TEXT		权限说明
jur_createtime	N	日期时间		创造时间
jur_createman	N	数值		创建人


名称：酒店信息表（hotel）                             编号：D011
简述：存储参会代表可以入住的酒店的信息的表
去向：酒店信息管理、房间类型信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
hot_no	N	数值		酒店编号，每个酒店的编号是唯一且由系统自动生成
hot_name	N	字符	30	酒店名
hot_tel	N	字符	15	电话号码
hot_address	N	字符	60	地址
hot_capital	Y	TEXT		资费详情（作废属性）
hot_remarks	Y	TEXT		备注
hot_room	Y	字符	10	会务组房间
hot_linkman	Y	TEXT		会务组联系人
hot_arrangement	Y	TEXT		前往会场安排


名称：房间类型信息表（room）                        编号：D012
简述：存储酒店房间类型信息的表
去向：房间预订管理、房间类型信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
roo_no	N	数值		房间类型编号，每个房间类型的编号是唯一且由系统自动生成
roo_name	N	字符	20	房间类型名
roo_description	Y	TEXT		描述
roo_available	N	数值		可入住数量
roo_hotel	N	数值		所属酒店


名称：预约信息表（check）                            编号：D013
简述：存储参会代表预约房间类型信息的表
去向：预约信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
che_no	N	数值		预约信息编号，每条预约信息的编号是唯一且由系统自动生成
che_method	N	数值		支付手段编号
che_account	N	字符	30	支付账号
che_money	N	数值		支付金额
che_time	N	日期时间		支付时间
che_representor	N	数值		支付者（参会代表）编号
che_teacher	N	数值		操作者（职工）编号
che_room	N	数值		预约房间类别编号


名称：支付手段表（method）                           编号：D014
简述：存储参会代表预约房间类型时可以使用的支付手段的表
去向：预约信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
met_no	N	数值		支付手段编号，每条支付手段的编号是唯一且由系统自动生成
met_name	N	字符	20	支付手段名
met_brief	Y	TEXT		简要说明
met_createtime	N	日期时间		创造时间
met_createman	N	数值		创造人编号


名称：论文作者表（author）                          编号：D015
简述：存储参会代表提交论文时填写的论文作者的表
去向：论文上传管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
aut_no	N	数值		论文作者编号，每个论文作者的编号是唯一且由系统自动生成
aut_category	N	字符	30	作者类别
aut_name	N	字符	30	作者名
aut_tel	Y	字符	11	手机号码
aut_email	Y	字符	30	电子邮件
aut_company	Y	字符	30	工作单位
aut_dissertation	N 	数值		论文号


名称：论文审核表（review）                          编号：D016
简述：存储论文审核结果的表
去向：论文审核管理、论文分派管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
rev_no	N	数值		论文审核编号，每条论文审核的编号是唯一且由系统自动生成
rev_dissertation	N	数值		论文号
rev_teacher	N	数值		职工号
rev_condition	N	数值		状态号
rev_proposal	Y	TEXT		修改建议
rev_assigntime	Y	日期时间		分派时间
rev_reviewtime	Y	日期时间		审核时间


名称：周边信息表（related）                           编号：D017
简述：存储学校、学院介绍以及周围景点的表
去向：周边信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
rel_no	N	数值		周边信息编号，每条周边信息的编号是唯一且由系统自动生成
rel_name	N	字符	30	周边名
rel_brief	Y	TEXT		简介
rel_photo	Y	字符	30	照片存储地址


名称：账单信息表（bill）                             编号：D018
简述：存储记录职工在执行工作中购买物品产生的消耗的表
去向：账单信息管理
数据项条目：
名称	可否为空	类型	长度	含义及其他说明
bill_no	N	数值		账单信息编号，每条账单信息的编号是唯一且由系统自动生成
bill_money	N	数值		金额
bill_detail	N	TEXT		明细
bill_date	N	日期		日期
bill_personnel	N	数值		编号



