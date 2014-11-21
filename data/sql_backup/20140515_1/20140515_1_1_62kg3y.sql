-- TOTAL : 1
-- ECMall 2.0 SQL Dump Program
-- Apache/2.2.16 (Win32) PHP/5.2.14
-- 
-- DATE : 2014-05-15 16:59:37
-- MYSQL SERVER VERSION : 5.0.90-community-nt
-- PHP VERSION : 5.2.14
-- ECMall VERSION : 2.3.0
-- Vol : 1
DROP TABLE IF EXISTS ecm_acategory;
CREATE TABLE ecm_acategory (
  cate_id int(10) unsigned NOT NULL auto_increment,
  cate_name varchar(100) NOT NULL default '',
  parent_id int(10) unsigned NOT NULL default '0',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  `code` varchar(10) default NULL,
  PRIMARY KEY  (cate_id)
) TYPE=MyISAM;
INSERT INTO ecm_acategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order`, `code` ) VALUES  ('1','�̳ǰ���','0','0','help');
INSERT INTO ecm_acategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order`, `code` ) VALUES  ('2','�̳ǹ���','0','0','notice');
INSERT INTO ecm_acategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order`, `code` ) VALUES  ('3','��������','0','0','system');
INSERT INTO ecm_acategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order`, `code` ) VALUES  ('4','������·','1','1',null);
INSERT INTO ecm_acategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order`, `code` ) VALUES  ('5','����ָ��','1','2',null);
DROP TABLE IF EXISTS ecm_address;
CREATE TABLE ecm_address (
  addr_id int(10) unsigned NOT NULL auto_increment,
  user_id int(10) unsigned NOT NULL default '0',
  consignee varchar(60) NOT NULL default '',
  region_id int(10) unsigned default NULL,
  region_name varchar(255) default NULL,
  address varchar(255) default NULL,
  zipcode varchar(20) default NULL,
  phone_tel varchar(60) default NULL,
  phone_mob varchar(60) default NULL,
  PRIMARY KEY  (addr_id),
  KEY user_id (user_id)
) TYPE=MyISAM;
INSERT INTO ecm_address ( `addr_id`, `user_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob` ) VALUES  ('1','4','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999');
INSERT INTO ecm_address ( `addr_id`, `user_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob` ) VALUES  ('2','2','��ΰ','2','�й�','�人','430040','','15102754945');
DROP TABLE IF EXISTS ecm_advert;
CREATE TABLE ecm_advert (
  ad_id int(255) NOT NULL auto_increment,
  ad_name varchar(255) NOT NULL,
  ad_img varchar(255) NOT NULL,
  ad_link varchar(255) NOT NULL,
  ad_int int(255) NOT NULL default '0',
  ad_vip int(255) NOT NULL default '0',
  PRIMARY KEY  (ad_id)
) TYPE=MyISAM;
INSERT INTO ecm_advert ( `ad_id`, `ad_name`, `ad_img`, `ad_link`, `ad_int`, `ad_vip` ) VALUES  ('20','���ϴ�˹��ʽ�˶�Ь','ad/���ϴ�˹��ʽ�˶�Ь.png','http://127.0.0.7/index.php?app=goods&id=24','5','3');
INSERT INTO ecm_advert ( `ad_id`, `ad_name`, `ad_img`, `ad_link`, `ad_int`, `ad_vip` ) VALUES  ('23','����OL������˿ѩ�İ���ȹ��֯����ȹ','ad/����OL������˿ѩ�İ���ȹ��֯����ȹ.png','http://127.0.0.7/index.php?app=goods&id=19','1','0');
INSERT INTO ecm_advert ( `ad_id`, `ad_name`, `ad_img`, `ad_link`, `ad_int`, `ad_vip` ) VALUES  ('22','����֯��Ů����ȹŮװ','ad/����֯��Ů����ȹŮװ.png','http://127.0.0.7/index.php?app=goods&id=18','3','2');
INSERT INTO ecm_advert ( `ad_id`, `ad_name`, `ad_img`, `ad_link`, `ad_int`, `ad_vip` ) VALUES  ('21','ŷ�����������߷���������װ��ˮ��Բ����С����','ad/ŷ�����������߷���������װ��ˮ��Բ����С����.png','http://127.0.0.7/index.php?app=goods&id=28','3','1');
DROP TABLE IF EXISTS ecm_article;
CREATE TABLE ecm_article (
  article_id int(10) unsigned NOT NULL auto_increment,
  `code` varchar(20) NOT NULL default '',
  title varchar(100) NOT NULL default '',
  cate_id int(10) NOT NULL default '0',
  store_id int(10) unsigned NOT NULL default '0',
  link varchar(255) default NULL,
  content text,
  sort_order tinyint(3) unsigned NOT NULL default '255',
  if_show tinyint(3) unsigned NOT NULL default '1',
  add_time int(10) unsigned default NULL,
  PRIMARY KEY  (article_id),
  KEY `code` (`code`),
  KEY cate_id (cate_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('1','eula','�û�����Э��','3','0','','<p>�ر������û������Ķ������û�����Э�顷(�³ơ�Э�顷) �и�������������ܱ���Э�顷�����������Ȩʹ�ñ���վ�ṩ����ط�������ʹ����Ϊ����Ϊ�Ա���Э�顷�Ľ��ܣ���ͬ����ܱ���Э�顷���������Լ���� <br /> <br /> <strong>һ������</strong><br /></p>\r\n<ol>\r\n<li>\"�û�\"ָ���ϱ�Э�����涨��������ͬ�����ر���վ���ֹ�����������������ڱ�Э�飩����ʹ�ñ���վ�ĸ��˻������</li>\r\n<li>\"����\"��ָ�ڱ���վ�ϳ�����Ʒ���û���\"���\"��ָ�ڱ���վ������Ʒ���û���</li>\r\n<li>\"�ɽ�\"ָ��Ҹ������������ǵĽ���Ҫ�����ض�ʱ����������ŵĽ������������ȡ�������������������ý�����Ʒ��Ȩ����</li>\r\n</ol>\r\n<p><br /> <br /> <strong>�����û��ʸ�</strong><br /> <br /> ֻ�з�����������֮һ����Ա��ʵ����������Ϊ����վ�û�������ʹ�ñ���վ�ķ���</p>\r\n<ol>\r\n<li>����ʮ���꣬����������Ȩ��������������Ϊ��������Ȼ�ˣ�</li>\r\n<li>δ��ʮ���꣬���໤�ˣ��������������ڸ�ĸ����������ͬ�����Ȼ�ˣ�</li>\r\n<li>�����й����ɻ������ط��ɡ������/����³������Ϸ����ڵĹ�˾������ҵ��λ��������֯��������֯��</li>\r\n</ol>\r\n<p><br /> ��������Ϊ�����ˡ�����������Ϊ�������Լ��޾�Ӫ���ض���Ӫ�ʸ����֯����ע��Ϊ����վ�û��򳬹�������Ȩ������Ϊ������Χ���½��׵ģ����뱾��վ֮���Э����ʼ��Ч������վһ�����֣���Ȩ����ע�����û�����׷����ʹ�ñ���վ\"����\"��һ�з������Ρ�<br /> <br /> <strong>��.�û���Ȩ��������</strong><br /></p>\r\n<ol>\r\n<li>�û���Ȩ���ݱ�Э��Ĺ涨������վ��������ع������ñ���վ���Ͻ���ƽ̨��¼��Ʒ������������Ϣ����ѯ��Ʒ��Ϣ��������Ʒ���������û�������Ʒ������ͬ���ڱ���վ�����������μӱ���վ���йػ����Ȩ���ܱ���վ�ṩ���������й���Ѷ����Ϣ����</li>\r\n<li>�û���Ȩ������Ҫ��������ͽ������롣�û�Ӧ���Ը��û������е����л���¼���ȫ�����Ρ�</li>\r\n<li>�û�������ȷ������վ�ṩ���κ����ϡ�ע����Ϣ��ʵ׼ȷ����������������ʵ���������֤�š���ϵ�绰����ַ����������ȡ���֤����վ�������û�����ͨ��������ϵ��ʽ���Լ�������ϵ��ͬʱ���û�Ҳ���������������ʵ�ʱ��ʱ��ʱ�����й�ע�����ϡ�</li>\r\n<li>�û��������κ���ʽ����ת�û���Ȩ����ʹ���Լ��ڱ���վ���û��ʺš�</li>\r\n<li>�û�������ȷ���ڱ���վ���Ͻ���ƽ̨�ϵ�¼��Ʒ�������Ľ�����Ϣ��ʵ��׼ȷ�������ԡ�</li>\r\n<li>�û������ڱ���վ���Ͻ���ƽ̨�������ҽ�ֹ���۵Ļ��������۵���Ʒ�����������ַ�����֪ʶ��Ȩ�������Ϸ�Ȩ�����Ʒ��Ҳ��������Υ����ṫ������򹫹����µ���Ʒ��</li>\r\n<li>�û������ڱ���վ��������Υ����Υ����Ϣ����������������Ʒ��Ϣ��������Ϣ���������ӡ���Ʒ���ԣ��������ԣ��������ݵȡ�</li>\r\n<li>�û��ڱ���վ������Ӧ�����س�ʵ����ԭ�򣬲����Ը�Ԥ�������Ʒ�۸�Ȳ�����������ʽ�������Ͻ������򣬲��ô��������Ͻ����޹صĲ�����Ϊ�������ڽ���ƽ̨�Ϸ����κ�Υ����Ϣ��</li>\r\n<li>�û���Ӧ��ȡ�������ֶΣ���������������ٽ��ס����������ȷ�ʽ�����������������öȣ�����ò������ֶζ������������û������������û����öȡ�</li>\r\n<li>�û���ŵ�Լ���ʹ�ñ���վ���Ͻ���ƽ̨ʵʩ��������Ϊ���ع��ҷ��ɡ�����ͱ���վ����ع涨�Լ�������ṫ������򹫹����¡������κη��ɺ���ķ������û������Լ�����������е�������Ӧ�ķ������Ρ�</li>\r\n<li>�û��ڱ���վ���Ͻ��׹��������������û����ײ������ף�����������վ��������Э�����û��緢�������û���Υ����Υ����Э�����Ϊ����������վ�ٱ������û������Ͻ����������û��������ϵģ��û���Ȩͨ��˾������Ҫ����վ�ṩ������ϡ�</li>\r\n<li>�û�Ӧ���ге����ײ�������ط��ã���������˰��</li>\r\n<li>δ������վ���������û����ý�����վ�����Լ��ڽ���ƽ̨����չʾ���κ���Ϣ�Ը��ơ��޸ġ��������ʽ����������Ʒ���ַ��򹫿�չʾ��</li>\r\n<li>�û�ͬ��������Ա���վ����Ϣ�������������ڻ��Ϣ��������Ϣ��������Ϣ�ȡ�</li>\r\n</ol>\r\n<p><br /> <br /> <strong>�ġ� ����վ��Ȩ��������</strong><br /></p>\r\n<ol>\r\n<li>����վ���Ǵ�ͳ�����ϵ�\"������\"����Ϊ�û��ṩһ����Ϣ������������Ʒ������ƽ̨���䵱����˫��֮��Ľ���ý�飬���������������Ĵ����̡��ϻ�  �ˡ���Ա������Ⱦ�Ӫ��ϵ�ˡ������ڱ���վ�ϵĽ�����Ʒ���û������ϴ����н��׵���Ʒ�����Ǳ���վ���С������û�������Ʒ���ṩ����Ϣ����뾺��Ĺ��̣�  ����վ�������Լ��ӻ���ƣ��಻������Ʒ�Ľ��׹��̣��������͡�����˿覴õ�����������������Ҳ��е�������Ʒ����Ʒ�ʡ�Ȩ���ϵ�覴��Լ�����  �����н���Э����������������κ����Σ����ڳ����������ϵ���ƷƷ�ʡ���ȫ�Ի�Ϸ��ԣ�����վ�����豣֤��</li>\r\n<li>����վ�����������м���ˮƽ�Ļ�����Ŭ��ȷ���������Ͻ���ƽ̨���������У�������������жϻ��ж�ʱ�����������ʱ���ڣ���֤�û����Ͻ��׻��˳�����С�</li>\r\n<li>����վ��������û���ע��ʹ�ñ���վ���Ͻ���ƽ̨�������������⼰��ӳ�������ʱ�����ظ��� </li>\r\n<li>����վ��Ȩ���û���ע�����Ͻ��в��ģ��Դ����κ�������ɵ�ע�����ϣ�����վ��Ȩ����֪ͨѯ���û���Ҫ���û��������͡���������ֱ������������ɾ���ȴ���</li>\r\n<li>��  �����ڱ���վ���Ͻ����������û��������׵ģ��û�ͨ��˾�����Ż������������շ�������Ҫ����վ�ṩ������ϣ�����վ��������ϲ��ṩ�й����ϣ��û�����  �׸�֪����վ������վ֪Ϥ��������ģ�����˺󣬱���վ��Ȩͨ�������ʼ����绰��ϵ�����˫���˽����������������˽�����ͨ�������ʼ�����֪ͨ��  ���� </li>\r\n<li>�����Ͻ���ƽ̨�������ԣ�����վû������������û���ע�����ϡ����еĽ�����Ϊ�Լ��뽻���йص������������������飬���緢���������Σ�����վ��Ȩ�����û��Ļ�����û���ʵ�й����ϡ���������֪ͨ����ʱ��ֹ�������ڵ���ֹ���ܾ�����û��ṩ����         \r\n<ul>\r\n<li>�û�Υ����Э������ἰ�����뱾Э����ļ���</li>\r\n<li>�����û�������������֪ͨ����վ����Ϊĳ���û�����彻���������Υ���򲻵���Ϊ�����ṩ���֤�ݣ�������վ�޷���ϵ�����û���֤����֤���û�����վ�ṩ���κ����ϣ�</li>\r\n<li>�����û�������������֪ͨ����վ����Ϊĳ���û�����彻���������Υ���򲻵���Ϊ�����ṩ���֤�ݡ�����վ����ͨ��רҵ�����ߵ�֪ʶˮƽ��׼��������ݽ����б𣬿���������Ϊ��Щ���ݻ���Ϊ���ܶԱ���վ�û�����վ��ɲ�����ʧ�������Ρ� </li>\r\n</ul>\r\n</li>\r\n<li>�ڷ�������թ�ж��У����ű�������û������ԭ�򣬵��û��ٱ��Լ����׿��ܴ�����թ��������������ʱ������վ��Ȩͨ�������ж���ʱ��������û��˺ţ�����Ȩ�˶Ե�����������ϼ�Ҫ���ṩ�������֤�����ϡ�</li>\r\n<li>���ݹ��ҷ��ɷ��桢��Э������ݺͱ���վ�����յ���ʵ���ݣ������϶��û�����Υ����Υ����Э����Ϊ�Լ��ڱ���վ����ƽ̨�ϵ�����������Ϊ������վ��Ȩ�ڱ���վ����ƽ̨��������վ�������緢����ʽ�����û���Υ����Ϊ������Ȩ��ʱ����ɾ�������Ϣ�������������û���ͬ�⡣</li>\r\n<li>��  ��վ��Ȩ�ڲ�֪ͨ�û���ǰ����ɾ�����ȡ���������Դ�ʩ����������Ϣ���������������Թ�ܷ���ΪĿ�ģ��Գ�������ΪĿ�ģ�������թ�ȶ����������ݣ�����  �Ͻ����޹ػ����Խ���ΪĿ�ģ����ڶ��⾺�ۻ�������ͼ�������������������أ�����ϢΥ�������������������𺦱���վ�������û��Ϸ�����ġ�</li>\r\n<li>��  �����豾��վ���ҵġ�ȫ��ͨ�õġ����õġ���ѵ���Ϣ���ʹ��Ȩ��������վ��Ȩ�Ը�Ȩ����������Ȩ��������Ȩ����վ��Ȩ(ȫ���򲿷ݵ�)  ʹ�á����ơ��޶�����д�����������롢�ַ���ִ�к�չʾ�û���ʾ����վ�ĸ�����Ϣ��������������Ʒ����������֪���պ󿪷����κ���ʽ��ý�������������  ��Ϣ����������Ʒ�ڡ�</li>\r\n</ol>\r\n<p><br /> <br /> <strong>�塢������жϺ���ֹ</strong><br /></p>\r\n<ol>\r\n<li>��  ����վδ���û���ȡ��ط�����õ�����£�����վ������ȫȨ�������κ�����  (�����������ڱ���վ��Ϊ�û���Υ����Э�����������;��񣬻��û��ڳ���180����δ��¼����վ��)  ��ֹ���û��ķ��񣬲����ٱ����û��ڱ���վ��ȫ�����ϣ��������������û���Ϣ����Ʒ��Ϣ��������Ϣ�ȣ���ͬʱ����վ������ȫȨ�������ڷ���֪ͨ�򲻷���ͨ  ֪������£���ʱֹͣ�ṩȫ���򲿷ַ��񡣷�����ֹ�󣬱���վû������Ϊ�û�����ԭ�û����ϻ���֮��ص��κ���Ϣ����ת���κ�δ���Ķ����͵���Ϣ���û�  ������������⣬����վ������ֹ���û��ķ�������û����κε������е��κ����Ρ� </li>\r\n<li>���û�����վ���ע������վע���û���ݣ��辭����վ���ͬ�⣬�ɱ���վע����ע���û����û�������뱾��վ��Э���ϵ��������վ�Ա�������Ȩ����         \r\n<ul>\r\n<li>�û�ע���󣬱���վ��Ȩ�������û�������,��������������ǰ���û����ϡ��������ϡ���Ʒ���Ϻͽ��׼�¼�ȡ� </li>\r\n<li>�û�ע�������û���ע��ǰ�ڱ���վ����ƽ̨�ϴ���Υ����Ϊ��Υ����Э�����Ϊ������վ�Կ���ʹ��Э�����涨��Ȩ���� </li>\r\n</ul>\r\n</li>\r\n<li>������������������վ����ͨ��ע���û��ķ�ʽ��ֹ����         \r\n<ul>\r\n<li>���û�Υ����Э����ع涨ʱ������վ��Ȩ��ֹ����û��ṩ���񡣱���վ�����жϷ���ʱ֪ͨ�û���������û��ڱ�����վ��ֹ�ṩ�������һ��ֱ�ӻ��ӻ�����������ע��Ϊ����վ�û��ģ�����վ��Ȩ�ٴε�������ֹΪ���û��ṩ����</li>\r\n<li>һ������վ�����û�ע����������Ҫ��������ٵģ�����վ��Ȩ��ʱ��ֹΪ���û��ṩ���� </li>\r\n<li>��Э����ֹ�����ʱ���û�δȷ���µ�Э��ġ� </li>\r\n<li>��������վ��Ϊ����ֹ���������� </li>\r\n</ul>\r\n</li>\r\n<li>���û�Υ����ط��ɷ������Υ����Э��涨��ԭ�����ʹ����վ�жϡ���ֹ���û�����ģ����ڷ����жϡ���ֹ֮ǰ�û�������Ϊ������ԭ����         \r\n<ul>\r\n<li>����վ��Ȩ�����Ƿ����жϡ���ֹ���û�����ǰ���û����жϻ���ֹ����������ԭ��֪ͨ�û����׹�ϵ���������������ڶԸý�����������δ��ɽ��׵��û�,����ý��׾��۵��û����Ѵ�ɽ���ҪԼ�û���</li>\r\n<li>�����жϡ���ֹ֮ǰ���û��Ѿ��ϴ�������վ����Ʒ��δ���׻�����δ��ɵģ�����վ��Ȩ���жϡ���ֹ�����ͬʱɾ��������Ʒ�������Ϣ�� </li>\r\n<li>�����жϡ���ֹ֮ǰ���û��Ѿ��������û����۵ľ�����Ʒ����ҪԼ����������δ����������վ��Ȩ���жϻ���ֹ�����ͬʱɾ�����û������ҪԼ����Ϣ��</li>\r\n</ul>\r\n</li>\r\n<li>����վ�����û�����Ϊ�������������ڿ��ǵ���Ʒ���ڱ���վ���������ȣ��ֺ��˵�������Ȩ����Υ������ع涨�����ܵ���������׷�����ܵ����ܻ��صĴ���ʱ���û�Ӧ�⳥����վ�����������һ����ʧ�����á�</li>\r\n<li>��Υ����ط��ɷ������Υ����Э��涨����������ص��û�������վ��Ȩ��ֹ���û�����������</li>\r\n</ol>\r\n<p><br /> <br /> <strong>����Э����޶�</strong><br /> <br /> ��Э����ɱ���վ��ʱ�޶��������޶����Э�鹫���ڱ���վ֮�ϣ��޶�������������Թ���ʱ����Ч������Ϊ��Э���һ���֡��û����ڱ�Э���޸�֮���Լ���ʹ�ñ���վ������Ϊ�û����ܺ���Ը�����޶����Э�顣����վ��ʹ�޸Ļ��жϷ���ʱ��������κε���������<br /> <br /> <strong>�ߡ� ����վ�����η�Χ </strong><br /> <br /> ���û����ܸ�Э��ʱ���û�Ӧ��ȷ�˽Ⲣͬ���</p>\r\n<ol>\r\n<li>�Ƿ��ɱ���վ���ػ�ȡ���κ����ϣ����û����п��ǡ����������Ը����գ��������κ����϶������û�����ϵͳ���κ��𻵻�������ʧ���û�Ӧ����ȫ���Ρ�</li>\r\n<li>�û����ɱ���վȡ�õĽ������Ѷ����������ʽ����֣��������ɱ�Э��δ��ʾ�涨���κα�֤��</li>\r\n<li>��������ԭ�����ɵ�����������ʹ�á�������ʧ������������ʧ������վ���е��κ�ֱ�ӡ���ӡ��������ر������Ի�ͷ����⳥����ʹ����վ�ѱ���֪ǰ���⳥�Ŀ����ԣ���         \r\n<ul>\r\n<li>����վ��ʹ�û��޷�ʹ�á�</li>\r\n<li>���ɻ�ͨ������վ�����ȡ�õ��κ���Ʒ�������֮��Ϣ������н�������֮�����������Ʒ������Ĺ���ɱ���</li>\r\n<li>�û��Ĵ���������⵽δ����Ȩ�Ĵ�ȡ������</li>\r\n<li>����վ���κε�����֮��������Ϊ��</li>\r\n<li>����վ����������ˡ�</li>\r\n</ul>\r\n</li>\r\n<li>����վֻ��Ϊ�û��ṩһ�����׵�ƽ̨�������û������ǵĽ�����Ʒ�ĺϷ��ԡ���ʵ�Լ���Ʒ�ʣ��Լ��û����н��׵������ȣ�����վһ�ɲ����κε������Ρ��û������ʹ�ñ���վ�������򿯵��ڱ���վ���κ���Ʒ����������ʱ������վ�����κβ������⳥���Ρ�</li>\r\n<li>��  ��վ�ṩ�������������ϵ���վ����Դ�����ӣ��û����ܻ����������������Ӫ�̾�Ӫ����վ��������ʾ����վ����Щ��Ӫ�����κι�ϵ��������Ӫ�̾�Ӫ����վ��  �ɸ���Ӫ�����и��𣬲����ڱ���վ���Ƽ�����Χ֮�ڡ����ڴ��ڻ���Դ�ڴ�����վ����Դ���κ����ݡ���桢��Ʒ���������ϣ�����վ�಻�豣֤������ʹ  �û������κδ�����վ����Դ�����Ļ��ɴ�����վ����Դ��õ��κ����ݡ���Ʒ��������������κ��𺦻���ʧ������վ�����κ�ֱ�ӻ��ӵ����Ρ�</li>\r\n</ol>\r\n<p><br /> <br /> <strong>��.�����ɿ���</strong><br /> <br /> �򲻿ɿ����������������¼���ʹ�ñ�Э������в����ܡ�����Ҫ����������ģ�˫�������е����Ρ�����ͬ����֮���ɿ�����ָ����Ԥ�������ܱ��Ⲣ���ܿ˷���  �͹������������������ս����̨�硢ˮ�֡����֡��׻�����𡢰չ��������������������ڿ͹��������粡�������Ų��ż������ơ�������Ϊ���κ�������Ȼ����  Ϊ��ɵ����ѵȿ͹������<br /> <br /> <strong>�š���������ʽ</strong><br /></p>\r\n<ol>\r\n<li>��Э�鼰���޶�������Ч�ԡ����к��뱾Э�鼰���޶���Ч���йص��������ˣ������л����񹲺͹����ɹ�Ͻ���κ�����������л����񹲺͹����ɡ�</li>\r\n<li>��  ʹ�ñ���վ�����������뱾��վ���κ����飬��Ӧ�ύ�����ٲ�ίԱ�ᰴ�ոû��ʱ��Ч���ٲù�������ٲá��������Ӧ�����ٲã��������κ�����������������  ���ٲ��кϲ��������ٲòþ����վ֣��Ը�������Լ������������漰�����鲻�����ٲý�����û�ͬ��һ������������Ժ��Ͻ��</li>\r\n</ol>','255','1','1240122848');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('2','cert_autonym','ʲô��ʵ����֤','3','0','','<p><strong>ʲô��ʵ����֤��</strong></p>\r\n<p>&ldquo;��֤����&rdquo;������һ��Ե��������ʵ��ʶ����񡣵�������ͨ��վ��PM���绰�����ԱEMail�ķ�ʽ ��ϵ�����������֤����������Ա���ȷ���˵�������ʵ��ݣ��Ϳ��Կ�ͨ������֤��</p>\r\n<p>ͨ������֤������˵��������ݵ���ʵ��Ч�ԣ�Ϊ��������罻�׵Ĺ������ṩһ�������ĺͱ�֤��</p>\r\n<p><strong>��֤����ķ�ʽ��</strong></p>\r\n<p>Email��XXXX@XX.com</p>\r\n<p>����Ա��XXXXXX</p>','255','1','1240122848');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('3','cert_material','ʲô��ʵ�������֤','3','0','','<p><strong>ʲô��ʵ�������֤��</strong></p>\r\n<p>&ldquo;��֤����&rdquo;������һ��Ե��������ʵ��ʶ����񡣵�������ͨ��վ��PM���绰�����ԱEMail�ķ�ʽ ��ϵ�����������֤����������Ա���ȷ���˵�������ʵ��ݣ��Ϳ��Կ�ͨ������֤��</p>\r\n<p>ͨ������֤������˵��������ݵ���ʵ��Ч�ԣ�Ϊ��������罻�׵Ĺ������ṩһ�������ĺͱ�֤��</p>\r\n<p><strong>��֤����ķ�ʽ��</strong></p>\r\n<p>Email��XXXX@XX.com</p>\r\n<p>����Ա��XXXXXX</p>','255','1','1240122848');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('4','setup_store','����Э��','3','0','','<p>ʹ�ñ���˾�����������ص������������<br /><br />1.�û��ʸ�<br />����˾�ķ���������÷������ܹ�ǩ�����з���Լ�����ĺ�ͬ�ĸ����ṩ��������ʹ�á��ڲ�����ǰ���涨��ǰ���£�����˾�ķ�����18�������»���ʱ����������ֹ���û��ṩ�����������ʸ�����ʹ�ñ���˾�ķ��񡣴��⣬�����ʻ��������������ۣ����û���������������ת�û���ۡ����⣬����˾������������Ը��ֹ����ֹ�����ʻ���Ȩ����<br /><br />2.�������ϣ�����������������ӵ��κ���Ʒ�����ã�<br />*������թ�ԡ���١���׼ȷ������ԣ�<br />*�ַ��κε���������Ȩ��ר��Ȩ���̱�Ȩ����ҵ���ܻ�����ר��Ȩ���򷢱�Ȩ����˽Ȩ��<br />*Υ���κ����õķ��ɻ򷨹棨�������������йس��ڹ��ơ������߱������������������̷��������ӻ�ó�׹���/��ƽó�׷��ɵķ��ɻ򷨹棩��<br />*��������߷̰����ˣ��ֺ����˺Ϸ�Ȩ������ݣ�<br />*�����ࡢɫ�顢�Ĳ�����������ɱ���ֲ����߽�����������ݣ�<br />*���������ƻ����ı䡢ɾ��������Ӱ�졢���ܽ�ȡ��δ����Ȩ���Ӵ��������κ�ϵͳ�����ݻ�������ϵ��κβ�����������ľ����桢��ʱը����ɾ��Ӭ������ڲʵ������������������Գ���<br /><br />3.ΥԼ<br />�緢���������Σ�����˾�����������Ļ������ɾ��������Ʒ���򱾹�˾���������й�������Ϊ�ľ��桢��������֪ͨ����ʱ��ֹ�������ڵ���ֹ����ֹ�����û��ʸ񼰾ܾ������ṩ����<br />(a)��Υ����Э������뱾Э����ļ���<br />(b)����˾�޷���֤����֤���򱾹�˾�ṩ���κ����ϣ�<br />(c)����˾����������Ϊ���ܶ���������˾�û��򱾹�˾�����ʧ�������Ρ�<br /><br />4.��������<br />����˾������˾�Ĺ�����˾�����ʵ��򱾹�˾�Ĺ�Ӧ�����κ�����¾������򱾹�˾����վ������˾�ķ����Э�����������֮�йص�������ʧ���κ��ر𡢼�ӻ����Ե��𺦣������Ժ��ַ�ʽ����������������е��κ����Ρ���ͬ��������������Ϊ֮�Ϸ��Ե����е����Ρ���ͬ�⣬����˾�ͱ���˾�����й�����˾�����ʵ��Ա���˾�û�����Ϊ�ĺϷ��Լ��������κν�����е����Ρ�<br /><br />5.�޴����ϵ<br />�û��ͱ���˾�Ƕ����ĺ�ͬ������Э�����⽨��Ҳû�д����κδ����ϻ��Ӫ����Ա�����������Ӫ��ϵ������˾Ҳ�����κ��û��������Ͻ�����Ϊ������ʾ��Ĭ����Ƽ�����ŵ�򵣱���<br /><br />6.һ��涨<br />��Э�������з�������л����񹲺͹����ɹ�Ͻ����Э��Ĺ涨�ǿɷָ�ģ��籾Э���κι涨���ö�Ϊ��Ч�򲻿�ִ�У��ù涨�ɱ�ɾ������������Ӧ����ִ�С�</p>','255','1','1240122848');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('5','msn_privacy','MSN����ͨ��˽����','3','0','','<p>Msn����ͨ��˽����ּ��˵�����ڱ���վʹ��Msn����ͨ����ʱ������α�������Msn�ʺ���Ϣ��<br /> ������Ϊ��˽Ȩ�ǳ���Ҫ������ϣ������˽�����������������ڱ���վ����ʹ��Msn����ͨ<br /> <strong>�����ռ�����Ϣ</strong></p><blockquote>* ���ڱ���վ����Msn����ͨʱ,���򽫻��¼����Msn����ͨ�ʺ�</blockquote><p><br /> <strong>����ѡ��</strong></p><blockquote>* �������ڱ���վ��ʱע������Msn����ͨ�ʺ�</blockquote><p><br /> <strong>������˽����</strong></p><blockquote>* ���������Ҫ�ı䱾��վMsn����ͨ����˽����, ���ǻ����صĸĶ��ڴ�ҳ�淢��.</blockquote>','255','1','1240122848');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('6','','���ﱣ��','-1','3',null,'<p style=\"margin: 10px; line-height: 150%;\"><strong><span style=\"color: #0000ff;\">һ��רҵIT��Ʒ���� </span></strong><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��ʾ���̣�רҵ��IT��Ʒ������վ���������ʼǱ����ԡ�̨ʽ��������������������MP3��MP4������ɢ����DIYװ �����ֻ���ͨѶ�豸���칫�Ĳġ�������衢�ƶ��洢�������Ʒ����������ȡ�������ɿ��Ľ�����������רҵ�Ĺ����Ŷӣ������Ƶ����缼��ƽ̨���о���ḻ ���ۺ������Ա������ֵ����������<br /><br /><strong><span style=\"color: #0000ff;\">����ʵ���ֱ�ӹ��� </span></strong><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��ʾ��������ʵ���ֱ�ӹ���������ȫ��ÿ����������һ��ʵ��꣬�Թ��������������ۺ����<br /><br /><strong><span style=\"color: #0000ff;\">�������ȫ</span></strong> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; �û�����ѡ��Ƹ�ͨ����м����õ�����������������˹�˾���գ�������ת�ʡ�����֧������Ϊ���Ҷ���ʵ����̻�������֧���ǳ���ȫ��<br /><br /><strong><span style=\"color: #0000ff;\">�ġ����Ƶ��ۺ����</span></strong> <br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��Ϊ���۲�Ʒ������Ʒ�л�������ȫ����������Ʒ��������ȫ�����������۵���Ʒ���ṩ�뵽ʵ��깺��һ�����ۺ�����ϡ�</p>\r\n<p>&nbsp;</p>','1','1','1249544249');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('7','','ϵͳ����֪ͨ���ܶ�����','2','0','','<p><span style=\"font-size: 9pt; color: #666666; font-family: ����;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�޸ı�ҳ���ݣ��뵽</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�����̨</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span> ��վ<span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span>&nbsp;���¹���</span></span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\">&nbsp;&nbsp; �ҵ��������</span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">���б༭</span></strong></span></p>\r\n<p>�𾴵��û������ã�</p>\r\n<p>Ϊ�˸�����û��ṩ���õķ������� 2009�� 6�� 6�� 12:30 �� 14:00 ��ϵͳ������</p>\r\n<p>��ʱ��ҳ��������ʱ����ʹ�õ������</p>\r\n<p>�ڴˣ����ĵĸ�лÿλ�û�һ�����������ǹ�����֧�ֺ͹�ע��</p>','255','1','1249610440');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('8','','8��8����ͣ��Ʒ����','2','0','','<p><span style=\"font-size: 9pt; color: #666666; font-family: ����;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�޸ı�ҳ���ݣ��뵽</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�����̨</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span> ��վ<span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span>&nbsp;���¹���</span></span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\">&nbsp;&nbsp; �ҵ��������</span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">���б༭</span></strong></span></p>\r\n<p><span>�����Ĺ˿ͣ� <br />�� �ǽ�����2009��8��8�ս����ڲ���Ʒ�̵�����ϣ����콫��ͣ��Ʒ�ĳ��⣬����Ϊ�˹���û��ܹ���������һ�յ������������������� 16��00 ǰ ���ɵ���Ч���ض��� (�⻷�����ض��������������緢������������ʱ����ݶ�����ѡ�Ļ��˷�ʽ����) ����ԭ�е��Ϻ��⻷�����ڵ�һ�ն��͸�Ϊһ��һ�͵����ͷ�ʽ�� 8��8������ʱ��Ϊ����9:00 ������ 18��00���ɴ�Ϊ�������Ĳ��㣬�������½⡣ ��ʱ���ǽ����ṩ�������ᣬ�ۺ���ͻ����������� ��2008��8��8�����ڶ����⻷�����ڵ����ͻָ�Ϊһ�ն��͡� �ڴ����ĵĸ�л��λ�˿�һ�����������ǹ�����֧�ֺ͹�ע��</span></p>','255','1','1249610480');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('9','','��Ʒ���۸İ�����!','2','0','','<p><span style=\"font-size: 9pt; color: #666666; font-family: ����;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�޸ı�ҳ���ݣ��뵽</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�����̨</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span> ��վ<span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span>&nbsp;���¹���</span></span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\">&nbsp;&nbsp; �ҵ��������</span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">���б༭</span></strong></span></p>\r\n<p>���ȣ�Ϊ��ʹ�ô���ܸ���ֲ��룬���ǽ��𲽷ſ��Բ�Ʒ���۵��ʸ����ƣ� �˿Ϳ����ڹ�����Ʒ�����Ʒ�������ۣ������˿ͻ����Զ����۽����Ƿ�����Ĳ��룬�õ��϶��û����������۽��õ������չʾ���ᡣ</p>','255','1','1249610514');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('10','','����ϵͳ����ͨ�棡','2','0','','<p><span style=\"font-size: 9pt; color: #666666; font-family: ����;\"><strong><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�޸ı�ҳ���ݣ��뵽</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\"> </span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">�����̨</span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span> ��վ<span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\"> <span style=\"font-size: 10.5pt; color: red; font-family: ����;\">&gt;&gt;</span>&nbsp;���¹���</span></span><span style=\"font-size: 10.5pt; color: red; font-family: \'Times New Roman\';\" lang=\"EN-US\">&nbsp;&nbsp; �ҵ��������</span><span style=\"font-size: 10.5pt; color: red; font-family: ����;\">���б༭</span></strong></span></p>\r\n<p>���Ĺ˿ͣ�<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; ��������ϵͳ����12.10�Ž�������������ڴ��ڼ䣬����֧��ҵ�񽫻���ͣ������վ������ͣ����֧����ʽ�Ķ������Դ˽���ͨ�棬лл��һ���֧�֡�</p>','255','1','1249610535');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('11','','�˿ͱض�','4','0','','<h4><br /></h4>\r\n<h4>��ζ�����Ʒ��</h4>\r\n<p>����������������ǵ���վ�˽���Ʒ���������������Ʒ������ֱ�������ǵ���վ��ʵ�ֶ�������Ҳ���Ժ�������վ�Ŀͷ���Ա��ϵ������</p>\r\n<h4>��ͨ����վ�������ǵ���Ʒ����ò��������Ҳ��Ǿ�������������Լ�һЩ��Ʒ��ͼƬ�ͽ��ܸ�����</h4>\r\n<p>�����ǵ���վ�᲻���ڵ�Ϊ��Ա������Ʒ��Ϣ���ϵĵ����ʼ��������Ŀǰ��û�г�Ϊ���ǵĻ�Ա��������ֱ�������ǵ���վ��ע�ᣬ�ǳ����㡣</p>\r\n<h4>������������ﹺ������ɺ���</h4>\r\n<ol>\r\n<li>������һ��ӵ�г��ھ�Ӫ����ҵ�������վ��</li>\r\n<li>���ǽ������������ʵ���Ʒ�����Żݵļ۸�</li>\r\n<li>���ָ��ʽ�Լ����ٵ�ȫ�����ͣ�</li>\r\n<li>���Ի����˻������ˣ�</li>\r\n<li>������΢�Ļ�Ա���ּƻ���</li>\r\n<li>���в�ƷΪԭ�������װ��</li>\r\n</ol>\r\n<h4>���ǵ���Ʒ�Ҷ��ǳ�ϲ�����Ѿ������˺ܶ࣬������Щ��ôһֱû�����᲻�ᶩ������</h4>\r\n<p>������վ�˿͹������Ƚϴ���Ʒ��ʱ���ܶϻ���������ͨ����վ�ϵ�&ldquo;����֪ͨ&rdquo;��ťԤ����Ʒ��ֱ����ϵ���ǵ���վ�ͷ�����ԤԼ������</p>\r\n<h4>���еĲ�Ʒ���ܹ�����վ�Ϲ���?</h4>\r\n<p>��Ŀǰ��վ���ҵĶ��ǿ��Զ����ģ����Ǳ����ǲֿ����п��Ĳ�Ʒ���ǲſ�������ȷ�ϡ�����������ƷҲ����ͨ�����ǵ���վ��һ��ԤԼ���ȵ���Ʒ�������ǻ�����ͨ���绰���ߵ����ʼ��ķ�ʽ֪ͨ����������</p>\r\n<h4>ΪʲôҪע���Ա��</h4>\r\n<ol>\r\n<li>ֻ��ע���û��ſ��������Ͻ��ж����������Żݵļ۸�</li>\r\n<li>ֻ��ע���û��ſ��Ե�¼\"��Ա����\"��ʹ�ø���Ļ�Ա���﹦��,�����Լ������ϡ�</li>\r\n<li>ֻ��ע���û��ſ��������ϸ�����ע����������ԡ�</li>\r\n<li>ֻ��ע���û����п��ܻ�ȡ�������͵���Ʒ��</li>\r\n</ol>\r\n<h4>������������ô�죿</h4>\r\n<p>Ϊ�˱����ͻ����棬�����޷������������롣������������ʱ�����¼ע��ҳ�棬���\"��������\"��ϵͳ���Զ�����������ͨ��email�������������Ե�¼\"��Ա����\"ȥ�������룬��ȷ���������档</p>\r\n<h4>��������ô���£���ʲô���ã�</h4>\r\n<p>���ֵĸߵ�ֻ��ӳ�������ǵĹ�ע��֧�̶ֳȡ����ǵĻ�����ͨ��������Ʒ�����ġ����ڸ߻��ֵĿͻ����ǻ���һ���Ľ���������ֶһ���Ʒ�����ֵֿۼ۸�������Ʒ,���Żݵļ۸�����Ʒ�ȣ��Դ˻������˿͡�</p>','255','1','1249614530');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('12','','��Ʒ�˻�����','4','0','','<h4><br /></h4>\r\n<h4>������������������Ҫ�󻻻�</h4>\r\n<ol>\r\n<li>�ͻ����յ�����ʱ�������ͻ�Ա��ǰ�����飬���ֻ�������������ģ�</li>\r\n<li>ʵ���յ���������վ���������кܴ�ĳ���ġ�</li>\r\n</ol>\r\n<p><strong>��������</strong>���ͻ�����Ҫ���ͻ���Ա�˻ػ��Ȼ����������ϵ�����ǻ�Ϊ�����·��������ﵽ��ʱ��˳�ӡ�</p>\r\n<h4>������������������Ҫ���˻�</h4>\r\n<ol>\r\n<li>�ͻ��յ����������֮�ڣ�������Ʒ�����Ե�����ȱ�ݵģ�</li>\r\n<li>���ﾭ��һ�λ�������Ȼ������������ģ�</li>\r\n<li>������Ϊԭ����ɳ������ǳ�ŵ����֮��5�컹û�յ�����ġ�</li>\r\n</ol>\r\n<p><strong>�˻����̣�</strong>�ͻ����յ��������������������ϵ�����ǻ���������������ͨ�����л������Ļ����˻ء�</p>\r\n<h4>���������������Ȩ�ܾ��ͻ����˻���Ҫ��</h4>\r\n<ol>\r\n<li>����������𣬵�û�����ջ�ʱ����Ҫ���ͻ���Ա�����ģ�</li>\r\n<li>�����˻������޵��˻���Ҫ��</li>\r\n<li>�˻����ﲻȫ����������� ��</li>\r\n<li>�ͻ��������ݶ�ʧ���߲�ȫ��</li>\r\n<li>��Ʒ���������ṩ��</li>\r\n<li>���ﱾ��������������� ��</li>\r\n</ol>','255','1','1249614660');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('13','','�������ۺ����','5','0','','<p>&nbsp;</p>\r\n<p>����վ���۲�Ʒ��ʵ���������ߣ���˿ͱ������Чƾ֤����ȷ������Ϊ�����÷��񡣱���˾�Ŀͻ������ܹ��ҹ涨&ldquo;����&rdquo;�������Ը����ĵ������ﹺ�<br /></p>\r\n<h3>����ϸ��</h3>\r\n<h4>һ���ڱ���վ�������Ʒ���Թ�������(�Ե����Ǽ�Ϊ׼)7���ڳ������ܹ��ϣ�������ѡ���˻�������������</h4>\r\n<ol>\r\n<li>�ڽӵ����Ĳ�Ʒ���ҹ�˾��������Ʒ�ͳ�����Լά�����ļ�⣻ </li>\r\n<li>��ⱨ�����������Ϊ�𻵵ģ��ǲ�Ʒ�����������⣬�ҹ�˾�ἰʱ������Ҫ�������˿���ɻ�ά�ޡ� </li>\r\n<li>�����������޹��ϻ�����Ϊ������ɵĹ��ϣ��ҹ�˾�ἰʱ֪ͨ��������ѯ���Ĵ�������� </li>\r\n</ol>\r\n<h4>�����ڱ���˾�������Ʒ���Թ�����(�Ե����Ǽ�Ϊ׼)15���ڳ������ܹ��ϣ�������ѡ�񻻻�������(����15���˻����������ɵ���Ʒ������15���˻�����������ϸ�򡷰���)</h4>\r\n<ol>\r\n<li>�ڽӵ����Ĳ�Ʒ���ҹ�˾��������Ʒ�ͳ�����Լά�����ļ�⣻ </li>\r\n<li>��ⱨ�����������Ϊ�𻵵ģ��ǲ�Ʒ�����������⣬�ҹ�˾�ἰʱ������Ҫ�������˿���ɻ�ά�ޡ� </li>\r\n<li>�����������޹��ϻ�����Ϊ������ɵĹ��ϣ��ҹ�˾�ἰʱ֪ͨ��������ѯ���Ĵ��������</li>\r\n</ol>\r\n<h4>�����ڱ���˾�������Ʒ���Թ�����(�Ե����Ǽ�Ϊ׼)һ��֮�ڳ��ַ���Ϊ�𻵵��������⣬����˾��ŵ��ѱ��ޡ�</h4>\r\n<ol>\r\n<li>�ڽӵ����Ĳ�Ʒ���ҹ�˾��������Ʒ�ͳ�����Լά�����ļ�⣻ </li>\r\n<li>��ⱨ�����������Ϊ�𻵵ģ��ǲ�Ʒ�����������⣬�ҹ�˾�ἰʱ������Ҫ�������˿���ɻ�ά�ޡ� </li>\r\n<li>�����������޹��ϻ�����Ϊ������ɵĹ��ϣ��ҹ�˾�ἰʱ֪ͨ��������ѯ���Ĵ�������� </li>\r\n</ol>\r\n<h3>�շ�ά�ޣ�</h3>\r\n<h4>һ��������Ϊ��ɵĹ��ϣ�����˾����ȡ�շ�ά�ޣ�������</h4>\r\n<ol>\r\n<li>��Ʒ�ڲ���˽�Բ𿪻������κβ��ֱ����棻 </li>\r\n<li>��Ʒ��������벻������޷��ɹ��жϣ� </li>\r\n<li>����ˮ�����ѡ���ٻ��и�ʴ������ </li>\r\n<li>���˱����ڵ���Ʒ��</li>\r\n</ol>\r\n<h4>����������������������Ҫ�󻻻���</h4>\r\n<ol>\r\n<li>�ͻ����յ�����ʱ�������ͻ�Ա��ǰ�����飬���ֻ�������������� </li>\r\n<li>ʵ���յ���������վ���������кܴ�ĳ���� </li>\r\n<li>�������̣��ͻ�����Ҫ���ͻ���Ա�˻ػ��Ȼ����������ϵ�����ǻ���һ����������Ϊ�����·��������ﵽ��ʱ��˳�ӡ�</li>\r\n</ol>\r\n<h4>����������������������Ҫ���˻���</h4>\r\n<p>�ͻ��յ����������֮�ڣ�</p>\r\n<ol>\r\n<li>������Ʒ�����Ե�����ȱ�ݵ� </li>\r\n<li>���ﾭ��һ�λ�������Ȼ������������� </li>\r\n<li>������Ϊԭ����ɳ������ǳ�ŵ����֮�����컹û�յ������</li>\r\n</ol>\r\n<p>�˻����̣��ͻ����յ��������������������ϵ�����ǻ���������������ͨ�����л������Ļ����˻ء�</p>\r\n<h4>���������������Ȩ�ܾ��ͻ����˻���Ҫ��</h4>\r\n<ol>\r\n<li>����������𣬵�û�����ջ�ʱ����Ҫ���ͻ���Ա������ </li>\r\n<li>�����˻������޵��˻���Ҫ�� </li>\r\n<li>�˻����ﲻȫ����������� </li>\r\n<li>�ͻ��������ݶ�ʧ���߲�ȫ </li>\r\n<li>��Ʒ���������ṩ </li>\r\n<li>���ﱾ���������������</li>\r\n</ol>','255','1','1249614760');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('14','','��������','5','0','','<p>&nbsp;</p>\r\n<h4>��������</h4>\r\n<p>���򲻿ɿ����������޷����Ƶ�ԭ�������վ����ϵͳ�������޷�����ʹ�ã��Ӷ��������Ͻ����޷���ɻ�ʧ�йص���Ϣ����¼�ȣ���վ�����е����Ρ��������ǽ��ᾡ����Ŀ���Э�������ƺ����ˣ���Ŭ��ʹ�ͻ����ٿ������ܵľ�����ʧ��<br />�� ����԰��򷽵�Ҫ�����������������������ǵ�������������ڰ�ʱ��������������������������ʱЭ���򷽲�ѯ�����е��κ��������������ṩ���˿�֮����� ����һ�в�ѯ�������˾������������������Ĺ涨������������������ȫ�̲�ѯ����δ��֮ǰ���򷽲���Ҫ���⳥��������һ����ʵ���ջ���ϸ��ַ���ջ��˵� �������ⵢ��Ͷ�ݡ����ڱ��깺�����Ϊ��ͬ���������</p>\r\n<h4>�ͻ��ල</h4>\r\n<p>����ϣ��ͨ����иŬ����Ϊ�ͻ��ṩ��ѷ��������ڸ��ͻ��ṩ�����ȫ���н��ܿͻ��ļල��</p>\r\n<h4>���鴦��</h4>\r\n<p>����ͻ�����վ֮�䷢���κ����飬�����ݵ�ʱ˫�����϶���Э�����ط����������</p>','255','1','1249614798');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('15','','�򵥵Ĺ�������','5','0','','<h4><br /></h4>\r\n<h4>����ע�᣿</h4>\r\n<p>��������ֱ�ӵ��\"��Աע��\"����ע�ᡣע��ܼ򵥣���ֻ�谴ע���򵼵�Ҫ������һЩ������Ϣ���ɡ�Ϊ��׼ȷ��Ϊ�������������ע��ʱ��д������ʵ��Ϣ�����ǻ�Ϊ�����ܡ�������ʺ�Ҫ4-10λ������ʹ��Ӣ����ĸ������\"-\"��</p>\r\n<h4>������Ϊ��Ա?</h4>\r\n<p>��������ֱ�ӵ��\"��Ա��¼��ע��\"����ע�ᡣע��ܼ򵥣���ֻ�����ϵͳ��ʾ����������ϼ��ɣ�������д���ʱ����غ˶���д���ݵ�׼ȷ�ԣ����������Ļ�Ա�˺ź����룬�Ա�����ѯ��������ϣ����վ�ṩ��������ķ���ʱ���Ժ˶�������ݡ�</p>\r\n<h4>����������µ�������ôһ�����������أ�</h4>\r\n<p>�����ַ�ʽ�������̳��ķ�ʽʮ�����ƣ���ֻҪ�������ǵ���Ʒ����ҳ������\"��ʯ�鱦\"��\"���Զ���\"����ҳ��������ָ����·������Ϳ����ˡ� һ����������ϲ������Ʒ����������ʱ���\"���빺����\"��ť��������\"������\"����������԰�\"ȥ����̨\"�����ǵ���Ʒʮ�ַḻ�����������ģ������� ÿһҳ�ж���������ϸ���׵ĵ����������ǲ�����·�ġ�</p>','255','1','1249614826');
INSERT INTO ecm_article ( `article_id`, `code`, `title`, `cate_id`, `store_id`, `link`, `content`, `sort_order`, `if_show`, `add_time` ) VALUES  ('16','','��ʾ����','2','0','','<p>����һ����ʾ����</p>','255','1','1400055796');
DROP TABLE IF EXISTS ecm_attribute;
CREATE TABLE ecm_attribute (
  attr_id int(10) unsigned NOT NULL auto_increment,
  attr_name varchar(60) NOT NULL default '',
  input_mode varchar(10) NOT NULL default 'text',
  def_value varchar(255) default NULL,
  PRIMARY KEY  (attr_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_brand;
CREATE TABLE ecm_brand (
  brand_id int(10) unsigned NOT NULL auto_increment,
  brand_name varchar(100) NOT NULL default '',
  brand_logo varchar(255) default NULL,
  sort_order tinyint(3) unsigned NOT NULL default '255',
  recommended tinyint(3) unsigned NOT NULL default '0',
  store_id int(10) unsigned NOT NULL default '0',
  if_show tinyint(2) unsigned NOT NULL default '1',
  tag varchar(100) NOT NULL default '',
  PRIMARY KEY  (brand_id),
  KEY tag (tag)
) TYPE=MyISAM;
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('1','�����','data/files/mall/brand/1.gif','1','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('2','ESprit','data/files/mall/brand/2.jpg','2','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('3','����','data/files/mall/brand/3.jpg','3','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('4','G-Star','data/files/mall/brand/4.jpg','4','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('5','Lee','data/files/mall/brand/5.jpg','5','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('6','Jack & Jones','data/files/mall/brand/6.jpg','6','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('7','DIOR','data/files/mall/brand/7.jpg','6','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('8','Chanel','data/files/mall/brand/8.jpg','7','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('9','PUMA','data/files/mall/brand/9.jpg','8','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('10','����˹����','data/files/mall/brand/10.jpg','9','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('11','Adidas','data/files/mall/brand/11.jpg','10','1','0','1','');
INSERT INTO ecm_brand ( `brand_id`, `brand_name`, `brand_logo`, `sort_order`, `recommended`, `store_id`, `if_show`, `tag` ) VALUES  ('12','Nike','data/files/mall/brand/12.jpg','11','1','0','1','');
DROP TABLE IF EXISTS ecm_cart;
CREATE TABLE ecm_cart (
  rec_id int(10) unsigned NOT NULL auto_increment,
  user_id int(10) unsigned NOT NULL default '0',
  session_id varchar(32) NOT NULL default '',
  store_id int(10) unsigned NOT NULL default '0',
  goods_id int(10) unsigned NOT NULL default '0',
  goods_name varchar(255) NOT NULL default '',
  spec_id int(10) unsigned NOT NULL default '0',
  specification varchar(255) default NULL,
  price decimal(10,2) unsigned NOT NULL default '0.00',
  quantity int(10) unsigned NOT NULL default '1',
  goods_image varchar(255) default NULL,
  integral int(255) NOT NULL default '0',
  PRIMARY KEY  (rec_id),
  KEY session_id (session_id),
  KEY user_id (user_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_category_goods;
CREATE TABLE ecm_category_goods (
  cate_id int(10) unsigned NOT NULL default '0',
  goods_id int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (cate_id,goods_id),
  KEY goods_id (goods_id)
) TYPE=MyISAM;
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1201','25');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1201','28');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1201','29');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','4');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','6');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','10');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','13');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','18');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','19');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','21');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1202','23');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','1');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','3');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','7');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','9');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','14');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','17');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','20');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','22');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','26');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1203','27');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','2');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','5');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','8');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','11');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','12');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','15');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','16');
INSERT INTO ecm_category_goods ( `cate_id`, `goods_id` ) VALUES  ('1209','24');
DROP TABLE IF EXISTS ecm_category_store;
CREATE TABLE ecm_category_store (
  cate_id int(10) unsigned NOT NULL default '0',
  store_id int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (cate_id,store_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
INSERT INTO ecm_category_store ( `cate_id`, `store_id` ) VALUES  ('2','3');
INSERT INTO ecm_category_store ( `cate_id`, `store_id` ) VALUES  ('13','4');
DROP TABLE IF EXISTS ecm_collect;
CREATE TABLE ecm_collect (
  user_id int(10) unsigned NOT NULL default '0',
  `type` varchar(10) NOT NULL default 'goods',
  item_id int(10) unsigned NOT NULL default '0',
  keyword varchar(60) default NULL,
  add_time int(10) unsigned default NULL,
  PRIMARY KEY  (user_id,`type`,item_id)
) TYPE=MyISAM;
INSERT INTO ecm_collect ( `user_id`, `type`, `item_id`, `keyword`, `add_time` ) VALUES  ('4','goods','29','','1399424744');
DROP TABLE IF EXISTS ecm_coupon;
CREATE TABLE ecm_coupon (
  coupon_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  coupon_name varchar(100) NOT NULL default '',
  coupon_value decimal(10,2) unsigned NOT NULL default '0.00',
  use_times int(10) unsigned NOT NULL default '0',
  start_time int(10) unsigned NOT NULL default '0',
  end_time int(10) unsigned NOT NULL default '0',
  min_amount decimal(10,2) unsigned NOT NULL default '0.00',
  if_issue tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (coupon_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_coupon_sn;
CREATE TABLE ecm_coupon_sn (
  coupon_sn varchar(20) NOT NULL,
  coupon_id int(10) unsigned NOT NULL default '0',
  remain_times int(10) NOT NULL default '-1',
  PRIMARY KEY  (coupon_sn),
  KEY coupon_id (coupon_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_friend;
CREATE TABLE ecm_friend (
  owner_id int(10) unsigned NOT NULL default '0',
  friend_id int(10) unsigned NOT NULL default '0',
  add_time varchar(10) NOT NULL default '',
  PRIMARY KEY  (owner_id,friend_id)
) TYPE=MyISAM;
INSERT INTO ecm_friend ( `owner_id`, `friend_id`, `add_time` ) VALUES  ('4','3','1249545996');
DROP TABLE IF EXISTS ecm_function;
CREATE TABLE ecm_function (
  func_code varchar(20) NOT NULL default '',
  func_name varchar(60) NOT NULL default '',
  `privileges` varchar(255) NOT NULL default '',
  PRIMARY KEY  (func_code)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_gcategory;
CREATE TABLE ecm_gcategory (
  cate_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  cate_name varchar(100) NOT NULL default '',
  parent_id int(10) unsigned NOT NULL default '0',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  if_show tinyint(3) unsigned NOT NULL default '1',
  PRIMARY KEY  (cate_id),
  KEY store_id (store_id,parent_id)
) TYPE=MyISAM;
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1','0','��װ','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('2','0','T��','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('3','0','Polo��','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('4','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('5','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('6','0','ţ�п�','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('7','0','���п�','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('8','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('9','0','Ƥ��','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('10','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('11','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('12','0','Ƥ��','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('13','0','���޷�','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('14','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('15','0','�п�','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('16','0','������װ','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('17','0','����','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('18','0','ë��','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('19','0','�����װ','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('20','0','��װ�Ʒ�','1','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('21','0','Ůװ/Ůʿ��Ʒ','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('22','0','����/������','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('23','0','���޷�','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('24','0','����/�޷�','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('25','0','ë��','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('26','0','��������','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('27','0','��֯��','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('28','0','T��','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('29','0','����/����','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('30','0','����ȹ','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('31','0','С��װ','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('32','0','����','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('33','0','����','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('34','0','������','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('35','0','�������װ','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('36','0','����ȹ','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('37','0','ţ�п�','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('38','0','��˿��/ѩ����','21','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('57','0','��Ů����/�Ҿӷ�','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('58','0','����','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('59','0','������װ','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('60','0','Ůʿ�ڿ�','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('61','0','��ʿ�ڿ�','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('62','0','��������','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('63','0','��ů����','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('64','0','˯��','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('65','0','����/����','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('66','0','��������','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('67','0','��������','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('68','0','Ĩ��','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('69','0','����','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('70','0','�Ƕ�','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('71','0','�ص�/����/���/�����','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('72','0','�������¿�ʽ','57','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('73','0','�˶���/�������','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('74','0','T��','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('75','0','��������T��','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('76','0','�����ź�T��','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('77','0','��������T��','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('78','0','�����ź�T��','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('79','0','����/����','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('80','0','POLO��','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('81','0','����','74','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('82','0','�˶���װ','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('83','0','������װ','82','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('84','0','�ļ���װ','82','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('85','0','������װ','82','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('86','0','����','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('87','0','����','86','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('88','0','����','86','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('89','0','����','86','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('90','0','����','86','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('91','0','������','86','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('92','0','ë��/��֯','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('93','0','�˶���/ȹ','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('94','0','����','93','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('95','0','�п�','93','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('96','0','�̿�','93','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('97','0','�߷�/�ŷֿ�','93','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('98','0','�˶�ȹ','93','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('99','0','���','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('100','0','�п�','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('101','0','�˶����','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('102','0','�˶���','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('103','0','�˶��۾�','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('104','0','�˶�����','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('105','0','�˶��ֱ�','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('106','0','�˶�ˮ��','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('107','0','�˶�ë��','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('108','0','�����˶����','101','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('109','0','�˶�����','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('110','0','�����','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('111','0','���а�/��','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('112','0','Ǯ��','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('113','0','�����','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('114','0','˫���','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('115','0','Ͱ��','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('116','0','����','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('117','0','�����˶���','109','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('118','0','�˶�����/�ֻ�','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('119','0','�˶�����','73','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('120','0','ͷ��','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('121','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('122','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('123','0','��ϥ','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('124','0','���Ȱ�','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('125','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('126','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('127','0','ͷ��','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('128','0','��ͷ','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('129','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('130','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('131','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('132','0','�����׼�','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('133','0','����','119','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('134','0','�������/ñ��/Χ��','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('135','0','Ƥ��','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('136','0','����/����/����','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('137','0','ñ��','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('138','0','Χ��/˿��/����','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('139','0','���','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('140','0','���','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('141','0','�����','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('142','0','ͷ��','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('143','0','���','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('144','0','����','134','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('162','0','������Ь','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('163','0','����Ь','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('164','0','ƤЬ','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('165','0','ѥ��','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('166','0','����Ь','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('167','0','��Ь','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('168','0','����','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('169','0','����Ь','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('170','0','����Ь','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('171','0','��֯Ь/��Ь/�ֹ�Ь','162','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('172','0','ŮЬ','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('173','0','��Ь(¶�ű�)','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('174','0','ѥ��','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('175','0','ѩ��ѥ','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('176','0','��Ь','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('177','0','����','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('178','0','������Ь(��¶�ű�)','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('179','0','����ƤЬ(��¶�ű�)','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('180','0','����Ь','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('181','0','��Ь/ѥ','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('182','0','�廨Ь','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('183','0','��Ь/�ֹ�Ь','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('184','0','������Ь','172','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('185','0','�˶�Ь','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('186','0','����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('187','0','�ܲ�Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('188','0','����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('189','0','����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('190','0','��ë��Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('191','0','ȫ��Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('192','0','�����ղ�Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('193','0','����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('194','0','����Ь/��Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('195','0','����','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('196','0','�˶���Ь/ɳ̲Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('197','0','����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('198','0','����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('199','0','ƹ����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('200','0','���Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('201','0','��������Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('202','0','ѵ��Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('203','0','�˶���Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('204','0','רҵ����Ь','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('205','0','����','185','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('206','0','���Ƥ��/Ů��/�а�','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('207','0','Ů�õ����','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('208','0','Ů��б���','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('209','0','Ů�ö๦�ܰ�','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('210','0','�����','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('211','0','���õ����','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('212','0','�����ְ�','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('213','0','���ö๦�ܰ�','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('214','0','Ǯ��','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('215','0','˫�米��','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('216','0','���а�/����','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('217','0','����','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('218','0','�ذ�','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('219','0','�ļ���/����','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('220','0','���С��/Ů���ְ�/Ӳ�Ұ�','206','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('221','0','Ʒ���ֱ�/�����ֱ�','0','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('222','0','�б�','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('223','0','Ů��','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('224','0','���Ա�','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('225','0','�Ա�','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('226','0','����','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('227','0','�Ŷ���/�ղر�','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('228','0','�����ֱ�','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('229','0','�ֱ����','221','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('230','0','zippo/��ʿ����/�۾�','0','255','0');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('231','0','ZIPPO/֥��','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('232','0','Ʒ�ƴ���/��������','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('233','0','��ʿ����','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('234','0','��Ʒ����','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('235','0','�۾���','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('236','0','�۾�Ƭ','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('237','0','����۾�','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('238','0','̫���۾�','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('239','0','�����۾�','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('240','0','��Ӿ��','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('241','0','Ǳˮ��','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('242','0','˾����','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('243','0','��ѩ��','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('244','0','���Ի�Ŀ��','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('245','0','ҹ�Ӿ�','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('246','0','���Ӿ�','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('247','0','�ϻ���','239','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('248','0','�۾�����������','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('249','0','����/����/����','248','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('250','0','����','248','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('251','0','�����۾����º�','248','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('252','0','�����۾������','248','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('253','0','�۾������','248','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('254','0','����Һ��������Ʒ','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('255','0','�̾�','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('256','0','�̶�','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('257','0','����','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('258','0','�̶���','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('259','0','�̺�','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('260','0','�̶�������','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('261','0','ѹ������ع���','260','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('262','0','�̵�','260','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('263','0','�̶���','260','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('264','0','�̶������Ʒ','260','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('265','0','ͨ��','260','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('266','0','���̲�Ʒ','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('267','0','ѩ�Ѽ�/��','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('268','0','���','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('269','0','������','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('270','0','����','255','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('271','0','�ƾ�','230','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('272','0','��Ʒ/��������/ʱ����Ʒ','0','255','0');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('273','0','����/��׹','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('274','0','����/����/����','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('275','0','��ָ/ָ��','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('276','0','����','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('277','0','����/����','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('278','0','���¶�','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('279','0','������װ','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('280','0','����','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('281','0','�ڼ�','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('282','0','��ʯ/���Ʒ','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('283','0','�廷','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('284','0','DIY��Ʒ/���/ɢ��','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('285','0','���α���/������Ʒ/���κ�','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('286','0','������ʽ','272','255','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1200','3','����Ůװ','0','1','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1201','3','����','1200','1','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1202','3','��ȹ','1200','2','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1203','3','Ů��','1200','3','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1204','3','����','0','2','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1205','3','�����','1204','1','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1206','3','Ƥ��Ǯ��','1204','2','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1207','3','ʱ��ŮЬ','0','3','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1208','3','���ʵ�Ь','1207','1','1');
INSERT INTO ecm_gcategory ( `cate_id`, `store_id`, `cate_name`, `parent_id`, `sort_order`, `if_show` ) VALUES  ('1209','3','�˶�����','1207','2','1');
DROP TABLE IF EXISTS ecm_goods;
CREATE TABLE ecm_goods (
  goods_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  `type` varchar(10) NOT NULL default 'material',
  goods_name varchar(255) NOT NULL default '',
  description text,
  cate_id int(10) unsigned NOT NULL default '0',
  cate_name varchar(255) NOT NULL default '',
  brand varchar(100) NOT NULL,
  spec_qty tinyint(4) unsigned NOT NULL default '0',
  spec_name_1 varchar(60) NOT NULL default '',
  spec_name_2 varchar(60) NOT NULL default '',
  if_show tinyint(3) unsigned NOT NULL default '1',
  closed tinyint(3) unsigned NOT NULL default '0',
  close_reason varchar(255) default NULL,
  add_time int(10) unsigned NOT NULL default '0',
  last_update int(10) unsigned NOT NULL default '0',
  default_spec int(11) unsigned NOT NULL default '0',
  default_image varchar(255) NOT NULL default '',
  recommended tinyint(4) unsigned NOT NULL default '0',
  cate_id_1 int(10) unsigned NOT NULL default '0',
  cate_id_2 int(10) unsigned NOT NULL default '0',
  cate_id_3 int(10) unsigned NOT NULL default '0',
  cate_id_4 int(10) unsigned NOT NULL default '0',
  price decimal(10,2) NOT NULL default '0.00',
  integral int(255) NOT NULL default '0',
  tags varchar(102) NOT NULL,
  PRIMARY KEY  (goods_id),
  KEY store_id (store_id),
  KEY cate_id (cate_id),
  KEY cate_id_1 (cate_id_1),
  KEY cate_id_2 (cate_id_2),
  KEY cate_id_3 (cate_id_3),
  KEY cate_id_4 (cate_id_4),
  KEY brand (brand(10)),
  KEY tags (tags)
) TYPE=MyISAM;
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('1','3','material','���������ʿ�','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/35a.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/35b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/35c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/35d.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/35e.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','2','��ɫ','����','1','0',null,'1249547077','1249547077','1','data/files/store_2/goods_179/small_200908060822598478.jpg','1','21','32','0','0','99.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('2','3','material','��ɫ�߰��˶�Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0026.gif\" alt=\"\" /></p>\r\n<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0027.jpg\" alt=\"\" /></p>\r\n<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0028.jpg\" alt=\"\" /></p>','178','ŮЬ	������Ь(��¶�ű�)','G-Star','2','��ɫ','����','1','0',null,'1249547390','1249547390','4','data/files/store_2/goods_131/small_200908060828517782.jpg','1','172','178','0','0','188.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('3','3','material','09�¿�ְҵŮ��','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/34a.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/34b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/34c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/34d.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','0','','','1','0',null,'1249547562','1249547562','8','data/files/store_2/goods_107/small_200908060831473107.jpg','1','21','32','0','0','238.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('4','3','material','09�¿��������ȹ','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/24.jpg\" alt=\"\" /></div>','36','Ůװ/Ůʿ��Ʒ	����ȹ','Lee','0','','','1','0',null,'1249547772','1249547772','9','data/files/store_2/goods_66/small_200908060834263919.jpg','1','21','36','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('5','3','material','2009�Ϳ��¿��˶�Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0025.jpg\" alt=\"\" /></p>','191','�˶�Ь	ȫ��Ь','Nike','2','��ɫ','����','1','0',null,'1249547890','1249547960','11','data/files/store_2/goods_70/small_200908060837502713.jpg','1','185','191','0','0','688.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('6','3','material','���ʺ��澭�䳤��ѩ���°���֯����ȹ','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/23.jpg\" alt=\"\" /></div>','36','Ůװ/Ůʿ��Ʒ	����ȹ','Nike','0','','','1','0',null,'1249548137','1249548137','15','data/files/store_2/goods_95/small_200908060841358079.jpg','1','21','36','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('7','3','material','09����ר����Ʒ�ݻ�ϵ��9�ֿ�','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/36a.jpg\" alt=\"\" /><br /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/36c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/36d.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprite','2','��ɫ','����','1','0',null,'1249549645','1249549645','16','data/files/store_2/goods_186/small_200908060906263554.jpg','1','21','32','0','0','178.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('8','3','material','����Ʒ����Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0024.jpg\" alt=\"\" /></p>\r\n<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0023.jpg\" alt=\"\" /></p>','193','�˶�Ь	����Ь','PUM','2','��ɫ','����','1','0',null,'1249549693','1249549816','19','data/files/store_2/goods_187/small_200908060909472569.jpg','1','185','193','0','0','368.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('9','3','material','��Ů��ְҵ����','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/32a.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/32b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/32c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/32d.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/32e.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','0','','','1','0',null,'1249549936','1249549936','25','data/files/store_2/goods_98/small_200908060911381037.jpg','1','21','32','0','0','168.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('10','3','material','�ҾӺ������г�ȹ','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/22.jpg\" alt=\"\" /></div>','30','Ůװ/Ůʿ��Ʒ	����ȹ','G-Star','2','��ɫ','����','1','0',null,'1249550129','1249550129','26','data/files/store_2/goods_69/small_200908060914291406.jpg','1','21','30','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('11','3','material','�Ϳ˺�������˶�Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0022.gif\" alt=\"\" /></p>','178','ŮЬ	������Ь(��¶�ű�)','Nike','2','��ɫ','����','1','0',null,'1249550246','1249550246','30','data/files/store_2/goods_33/small_200908060917132087.jpg','1','172','178','0','0','268.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('12','3','material','09�¿�����˶�Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0020.jpg\" alt=\"\" /></p>\r\n<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0021.jpg\" alt=\"\" /></p>','187','�˶�Ь	�ܲ�Ь','PUMA','0','','','1','0',null,'1249550348','1249550348','34','data/files/store_2/goods_123/small_200908060918436837.jpg','1','185','187','0','0','268.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('13','3','material','����09�¿����Ů�߷�����֯ѩ������ȹ','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/21.jpg\" alt=\"\" /></div>','21','Ůװ/Ůʿ��Ʒ','DIOR','0','','','1','0',null,'1249550465','1249550465','35','data/files/store_2/goods_24/small_200908060920245196.jpg','1','21','0','0','0','179.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('14','3','material','�����ɫ����ϵ��ţ��С�ſ�','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/37a.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/37b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/37c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/37d.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','0','','','1','0',null,'1249550608','1249550637','37','data/files/store_2/goods_128/small_200908060922084636.jpg','1','21','32','0','0','125.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('15','3','material','�Ϳ˻�ɫŮʽ����Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0019.jpg\" alt=\"\" /></p>','178','ŮЬ	������Ь(��¶�ű�)','Nike','2','��ɫ','����','1','0',null,'1249550754','1249550754','38','data/files/store_2/goods_147/small_200908060925471585.jpg','1','172','178','0','0','578.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('16','3','material','���Ʒ����˶�Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0018.jpg\" alt=\"\" /></p>','178','ŮЬ	������Ь(��¶�ű�)','����','2','��ɫ','����','1','0',null,'1249550876','1249550876','42','data/files/store_2/goods_67/small_200908060927474675.jpg','1','172','178','0','0','128.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('17','3','material','��E��ٴ�����������г��㡾��ɫ��','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/30a.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/30b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/30c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/30d.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','0','','','1','0',null,'1249551261','1249552157','55','data/files/store_2/goods_121/small_200908060932011437.jpg','1','21','32','0','0','90.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('18','3','material','����֯��Ů����ȹŮװ','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/20.jpg\" alt=\"\" /></div>','30','Ůװ/Ůʿ��Ʒ	����ȹ','Jack & Jones','0','','','1','0',null,'1249551437','1249551437','47','data/files/store_2/goods_195/small_200908060936352784.jpg','1','21','30','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('19','3','material','����OL������˿ѩ�İ���ȹ��֯����ȹ','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/19.jpg\" alt=\"\" /></div>','30','Ůװ/Ůʿ��Ʒ	����ȹ','����˹����','0','','','1','0',null,'1249551552','1249551552','48','data/files/store_2/goods_109/small_200908060938292631.jpg','1','21','30','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('20','3','material','С��ţ��Ǧ�ʿ�','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/29a.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/29b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/29c.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/29d.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/29e.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','2','��ɫ','����','1','0',null,'1249551779','1249551779','49','data/files/store_2/goods_143/small_200908060942233830.jpg','1','21','32','0','0','129.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('21','3','material','09�����¿��Լ�󷽸���������֯����ȹ983������','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/18.jpg\" alt=\"\" /></div>','30','Ůװ/Ůʿ��Ʒ	����ȹ','Adidas','0','','','1','0',null,'1249552281','1249552281','56','data/files/store_2/goods_25/small_200908060950258122.jpg','1','21','30','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('22','3','material','�¿�����ʹ����˶�����','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/38a.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/38b.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/38c.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/38d.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','0','','','1','0',null,'1249552384','1249552384','57','data/files/store_2/goods_147/small_200908060952274906.jpg','1','21','32','0','0','111.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('23','3','material','��.��.��.��.���������µ�����֯����ȹ/��Ƥ��','<p><img src=\"http://pic.shopex.cn/pictures/goodsdetail/17.jpg\" alt=\"\" /></p>','30','Ůװ/Ůʿ��Ʒ	����ȹ','','0','','','1','0',null,'1249552499','1249552499','58','data/files/store_2/goods_64/small_200908060954245662.jpg','1','21','30','0','0','170.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('24','3','material','���ϴ�˹��ʽ�˶�Ь','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/danson0017.jpg\" alt=\"\" /></p>','178','ŮЬ	������Ь(��¶�ű�)','Adidas','2','��ɫ','����','1','0',null,'1249552624','1249552624','59','data/files/store_2/goods_20/small_200908060957002218.jpg','1','172','178','0','0','169.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('25','3','material','����濨����������','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/15.jpg\" alt=\"\" /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/16.jpg\" alt=\"\" /></div>','26','Ůװ/Ůʿ��Ʒ	��������','Chanel','2','��ɫ','����','1','0',null,'1249552779','1249552779','63','data/files/store_2/goods_139/small_200908060958592106.jpg','1','21','26','0','0','128.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('26','3','material','ϲƤ���ţ�ж̿�','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/39a.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/39b.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/39c.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/39d.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','0','','','1','0',null,'1249552900','1249552900','67','data/files/store_2/goods_47/small_200908061000474424.jpg','1','21','32','0','0','89.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('27','3','material','�����������п�','<p align=\"center\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/26a.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/26b.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/26c.jpg\" alt=\"\" /> <br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/26d.jpg\" alt=\"\" /><br /><img src=\"http://pic.shopex.cn/pictures/goodsdetail/26e.jpg\" alt=\"\" /></p>','32','Ůװ/Ůʿ��Ʒ	����','ESprit','2','��ɫ','����','1','0',null,'1249553044','1399429600','68','data/files/store_2/goods_5/small_200908061003253339.jpg','1','21','32','0','0','288.00','200','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('28','3','material','ŷ�����������߷���������װ��ˮ��Բ����С����','<div style=\"text-align: center;\"><img src=\"http://pic.shopex.cn/pictures/goodsdetail/14.jpg\" alt=\"\" /></div>','26','Ůװ/Ůʿ��Ʒ	��������','����˹����','0','','','1','0',null,'1249553192','1249553238','73','data/files/store_2/goods_115/small_200908061005154170.jpg','1','21','26','0','0','188.00','0','');
INSERT INTO ecm_goods ( `goods_id`, `store_id`, `type`, `goods_name`, `description`, `cate_id`, `cate_name`, `brand`, `spec_qty`, `spec_name_1`, `spec_name_2`, `if_show`, `closed`, `close_reason`, `add_time`, `last_update`, `default_spec`, `default_image`, `recommended`, `cate_id_1`, `cate_id_2`, `cate_id_3`, `cate_id_4`, `price`, `integral`, `tags` ) VALUES  ('29','3','material','�п�.�����¿�09����С�������¶��������ݴ�װ','<p><img src=\"http://pic.shopex.cn/pictures/goodsdetail/13.jpg\" alt=\"\" /></p>','22','Ůװ/Ůʿ��Ʒ	����/������','PUMA','0','','','1','0',null,'1249553354','1399366882','74','data/files/store_2/goods_121/small_200908061008412008.jpg','1','21','22','0','0','328.00','100','');
DROP TABLE IF EXISTS ecm_goods_attr;
CREATE TABLE ecm_goods_attr (
  gattr_id int(10) unsigned NOT NULL auto_increment,
  goods_id int(10) unsigned NOT NULL default '0',
  attr_name varchar(60) NOT NULL default '',
  attr_value varchar(255) NOT NULL default '',
  attr_id int(10) unsigned default NULL,
  sort_order tinyint(3) unsigned default NULL,
  PRIMARY KEY  (gattr_id),
  KEY goods_id (goods_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_goods_image;
CREATE TABLE ecm_goods_image (
  image_id int(10) unsigned NOT NULL auto_increment,
  goods_id int(10) unsigned NOT NULL default '0',
  image_url varchar(255) NOT NULL default '',
  thumbnail varchar(255) NOT NULL default '',
  sort_order tinyint(4) unsigned NOT NULL default '0',
  file_id int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (image_id),
  KEY goods_id (goods_id)
) TYPE=MyISAM;
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('1','1','data/files/store_2/goods_179/200908060822598478.jpg','data/files/store_2/goods_179/small_200908060822598478.jpg','255','3');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('2','1','data/files/store_2/goods_197/200908060823178267.jpg','data/files/store_2/goods_197/small_200908060823178267.jpg','255','4');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('3','1','data/files/store_2/goods_9/200908060823294001.jpg','data/files/store_2/goods_9/small_200908060823294001.jpg','255','5');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('4','1','data/files/store_2/goods_25/200908060823452419.jpg','data/files/store_2/goods_25/small_200908060823452419.jpg','255','6');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('5','1','data/files/store_2/goods_32/200908060823523184.jpg','data/files/store_2/goods_32/small_200908060823523184.jpg','255','7');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('6','1','data/files/store_2/goods_43/200908060824034431.jpg','data/files/store_2/goods_43/small_200908060824034431.jpg','255','8');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('7','2','data/files/store_2/goods_131/200908060828517782.jpg','data/files/store_2/goods_131/small_200908060828517782.jpg','255','9');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('8','2','data/files/store_2/goods_150/200908060829102798.jpg','data/files/store_2/goods_150/small_200908060829102798.jpg','255','10');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('9','2','data/files/store_2/goods_170/200908060829308411.jpg','data/files/store_2/goods_170/small_200908060829308411.jpg','255','11');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('10','3','data/files/store_2/goods_107/200908060831473107.jpg','data/files/store_2/goods_107/small_200908060831473107.jpg','255','12');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('11','3','data/files/store_2/goods_115/200908060831559591.jpg','data/files/store_2/goods_115/small_200908060831559591.jpg','255','13');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('12','3','data/files/store_2/goods_140/200908060832202677.jpg','data/files/store_2/goods_140/small_200908060832202677.jpg','255','14');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('13','3','data/files/store_2/goods_147/200908060832272714.jpg','data/files/store_2/goods_147/small_200908060832272714.jpg','255','15');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('14','4','data/files/store_2/goods_66/200908060834263919.jpg','data/files/store_2/goods_66/small_200908060834263919.jpg','255','16');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('15','4','data/files/store_2/goods_87/200908060834479577.jpg','data/files/store_2/goods_87/small_200908060834479577.jpg','255','17');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('16','4','data/files/store_2/goods_105/200908060835054315.jpg','data/files/store_2/goods_105/small_200908060835054315.jpg','255','18');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('17','4','data/files/store_2/goods_125/200908060835258625.jpg','data/files/store_2/goods_125/small_200908060835258625.jpg','255','19');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('18','4','data/files/store_2/goods_141/200908060835411590.jpg','data/files/store_2/goods_141/small_200908060835411590.jpg','255','20');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('19','4','data/files/store_2/goods_155/200908060835558086.jpg','data/files/store_2/goods_155/small_200908060835558086.jpg','255','21');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('20','5','data/files/store_2/goods_70/200908060837502713.jpg','data/files/store_2/goods_70/small_200908060837502713.jpg','255','22');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('21','6','data/files/store_2/goods_95/200908060841358079.jpg','data/files/store_2/goods_95/small_200908060841358079.jpg','255','23');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('22','6','data/files/store_2/goods_108/200908060841484621.jpg','data/files/store_2/goods_108/small_200908060841484621.jpg','255','24');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('23','6','data/files/store_2/goods_124/200908060842042302.jpg','data/files/store_2/goods_124/small_200908060842042302.jpg','255','25');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('24','7','data/files/store_2/goods_186/200908060906263554.jpg','data/files/store_2/goods_186/small_200908060906263554.jpg','255','26');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('25','7','data/files/store_2/goods_13/200908060906532764.jpg','data/files/store_2/goods_13/small_200908060906532764.jpg','255','27');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('26','7','data/files/store_2/goods_36/200908060907164774.jpg','data/files/store_2/goods_36/small_200908060907164774.jpg','255','28');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('27','8','data/files/store_2/goods_187/200908060909472569.jpg','data/files/store_2/goods_187/small_200908060909472569.jpg','255','29');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('28','8','data/files/store_2/goods_2/200908060910023266.jpg','data/files/store_2/goods_2/small_200908060910023266.jpg','255','30');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('29','9','data/files/store_2/goods_98/200908060911381037.jpg','data/files/store_2/goods_98/small_200908060911381037.jpg','255','31');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('30','9','data/files/store_2/goods_128/200908060912082754.jpg','data/files/store_2/goods_128/small_200908060912082754.jpg','255','32');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('31','10','data/files/store_2/goods_69/200908060914291406.jpg','data/files/store_2/goods_69/small_200908060914291406.jpg','255','33');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('32','10','data/files/store_2/goods_82/200908060914426191.jpg','data/files/store_2/goods_82/small_200908060914426191.jpg','255','34');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('33','10','data/files/store_2/goods_94/200908060914542008.jpg','data/files/store_2/goods_94/small_200908060914542008.jpg','255','35');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('34','10','data/files/store_2/goods_126/200908060915269026.jpg','data/files/store_2/goods_126/small_200908060915269026.jpg','255','36');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('35','11','data/files/store_2/goods_33/200908060917132087.jpg','data/files/store_2/goods_33/small_200908060917132087.jpg','255','37');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('36','12','data/files/store_2/goods_123/200908060918436837.jpg','data/files/store_2/goods_123/small_200908060918436837.jpg','255','38');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('37','12','data/files/store_2/goods_142/200908060919027810.jpg','data/files/store_2/goods_142/small_200908060919027810.jpg','255','39');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('38','13','data/files/store_2/goods_24/200908060920245196.jpg','data/files/store_2/goods_24/small_200908060920245196.jpg','255','40');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('39','13','data/files/store_2/goods_43/200908060920437979.jpg','data/files/store_2/goods_43/small_200908060920437979.jpg','255','41');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('40','13','data/files/store_2/goods_54/200908060920546675.jpg','data/files/store_2/goods_54/small_200908060920546675.jpg','255','42');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('41','14','data/files/store_2/goods_128/200908060922084636.jpg','data/files/store_2/goods_128/small_200908060922084636.jpg','255','43');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('42','14','data/files/store_2/goods_141/200908060922218002.jpg','data/files/store_2/goods_141/small_200908060922218002.jpg','255','44');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('43','14','data/files/store_2/goods_29/200908060923496883.jpg','data/files/store_2/goods_29/small_200908060923496883.jpg','255','45');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('44','15','data/files/store_2/goods_147/200908060925471585.jpg','data/files/store_2/goods_147/small_200908060925471585.jpg','255','46');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('45','16','data/files/store_2/goods_67/200908060927474675.jpg','data/files/store_2/goods_67/small_200908060927474675.jpg','255','47');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('46','17','data/files/store_2/goods_121/200908060932011437.jpg','data/files/store_2/goods_121/small_200908060932011437.jpg','255','48');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('47','17','data/files/store_2/goods_84/200908060934444841.jpg','data/files/store_2/goods_84/small_200908060934444841.jpg','255','49');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('48','18','data/files/store_2/goods_195/200908060936352784.jpg','data/files/store_2/goods_195/small_200908060936352784.jpg','255','50');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('49','18','data/files/store_2/goods_8/200908060936481674.jpg','data/files/store_2/goods_8/small_200908060936481674.jpg','255','51');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('50','18','data/files/store_2/goods_24/200908060937048695.jpg','data/files/store_2/goods_24/small_200908060937048695.jpg','255','52');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('51','19','data/files/store_2/goods_109/200908060938292631.jpg','data/files/store_2/goods_109/small_200908060938292631.jpg','255','53');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('52','19','data/files/store_2/goods_124/200908060938443027.jpg','data/files/store_2/goods_124/small_200908060938443027.jpg','255','54');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('53','19','data/files/store_2/goods_142/200908060939026685.jpg','data/files/store_2/goods_142/small_200908060939026685.jpg','255','55');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('54','20','data/files/store_2/goods_143/200908060942233830.jpg','data/files/store_2/goods_143/small_200908060942233830.jpg','255','56');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('55','20','data/files/store_2/goods_156/200908060942363092.jpg','data/files/store_2/goods_156/small_200908060942363092.jpg','255','57');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('56','20','data/files/store_2/goods_166/200908060942462672.jpg','data/files/store_2/goods_166/small_200908060942462672.jpg','255','58');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('57','21','data/files/store_2/goods_25/200908060950258122.jpg','data/files/store_2/goods_25/small_200908060950258122.jpg','255','59');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('58','21','data/files/store_2/goods_39/200908060950399637.jpg','data/files/store_2/goods_39/small_200908060950399637.jpg','255','60');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('59','21','data/files/store_2/goods_55/200908060950555738.jpg','data/files/store_2/goods_55/small_200908060950555738.jpg','255','61');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('60','21','data/files/store_2/goods_67/200908060951072027.jpg','data/files/store_2/goods_67/small_200908060951072027.jpg','255','62');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('61','22','data/files/store_2/goods_147/200908060952274906.jpg','data/files/store_2/goods_147/small_200908060952274906.jpg','255','63');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('62','22','data/files/store_2/goods_157/200908060952376888.jpg','data/files/store_2/goods_157/small_200908060952376888.jpg','255','64');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('63','23','data/files/store_2/goods_64/200908060954245662.jpg','data/files/store_2/goods_64/small_200908060954245662.jpg','255','65');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('64','23','data/files/store_2/goods_72/200908060954323544.jpg','data/files/store_2/goods_72/small_200908060954323544.jpg','255','66');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('65','23','data/files/store_2/goods_86/200908060954465326.jpg','data/files/store_2/goods_86/small_200908060954465326.jpg','255','67');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('66','24','data/files/store_2/goods_20/200908060957002218.jpg','data/files/store_2/goods_20/small_200908060957002218.jpg','255','68');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('67','25','data/files/store_2/goods_139/200908060958592106.jpg','data/files/store_2/goods_139/small_200908060958592106.jpg','255','69');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('68','25','data/files/store_2/goods_151/200908060959114414.jpg','data/files/store_2/goods_151/small_200908060959114414.jpg','255','70');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('69','25','data/files/store_2/goods_166/200908060959265796.jpg','data/files/store_2/goods_166/small_200908060959265796.jpg','255','71');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('70','26','data/files/store_2/goods_47/200908061000474424.jpg','data/files/store_2/goods_47/small_200908061000474424.jpg','255','72');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('71','26','data/files/store_2/goods_57/200908061000576924.jpg','data/files/store_2/goods_57/small_200908061000576924.jpg','255','73');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('72','26','data/files/store_2/goods_71/200908061001114276.jpg','data/files/store_2/goods_71/small_200908061001114276.jpg','255','74');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('73','26','data/files/store_2/goods_86/200908061001263175.jpg','data/files/store_2/goods_86/small_200908061001263175.jpg','255','75');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('74','27','data/files/store_2/goods_5/200908061003253339.jpg','data/files/store_2/goods_5/small_200908061003253339.jpg','1','76');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('75','27','data/files/store_2/goods_18/200908061003382600.jpg','data/files/store_2/goods_18/small_200908061003382600.jpg','255','77');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('76','27','data/files/store_2/goods_29/200908061003494534.jpg','data/files/store_2/goods_29/small_200908061003494534.jpg','255','78');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('77','28','data/files/store_2/goods_115/200908061005154170.jpg','data/files/store_2/goods_115/small_200908061005154170.jpg','255','79');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('78','28','data/files/store_2/goods_14/200908061006541461.jpg','data/files/store_2/goods_14/small_200908061006541461.jpg','255','80');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('79','28','data/files/store_2/goods_26/200908061007068653.jpg','data/files/store_2/goods_26/small_200908061007068653.jpg','255','81');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('80','29','data/files/store_2/goods_121/200908061008412008.jpg','data/files/store_2/goods_121/small_200908061008412008.jpg','1','82');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('81','29','data/files/store_2/goods_127/200908061008473587.jpg','data/files/store_2/goods_127/small_200908061008473587.jpg','255','83');
INSERT INTO ecm_goods_image ( `image_id`, `goods_id`, `image_url`, `thumbnail`, `sort_order`, `file_id` ) VALUES  ('82','0','data/files/store_3/goods_104/201405090745041424.jpg','data/files/store_3/goods_104/small_201405090745041424.jpg','255','84');
DROP TABLE IF EXISTS ecm_goods_qa;
CREATE TABLE ecm_goods_qa (
  ques_id int(10) unsigned NOT NULL auto_increment,
  question_content varchar(255) NOT NULL,
  user_id int(10) unsigned NOT NULL,
  store_id int(10) unsigned NOT NULL,
  email varchar(60) NOT NULL,
  item_id int(10) unsigned NOT NULL default '0',
  item_name varchar(255) NOT NULL default '',
  reply_content varchar(255) NOT NULL,
  time_post int(10) unsigned NOT NULL,
  time_reply int(10) unsigned NOT NULL,
  if_new tinyint(3) unsigned NOT NULL default '1',
  `type` varchar(10) NOT NULL default 'goods',
  PRIMARY KEY  (ques_id),
  KEY user_id (user_id),
  KEY goods_id (item_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_goods_spec;
CREATE TABLE ecm_goods_spec (
  spec_id int(10) unsigned NOT NULL auto_increment,
  goods_id int(10) unsigned NOT NULL default '0',
  spec_1 varchar(60) NOT NULL default '',
  spec_2 varchar(60) NOT NULL default '',
  color_rgb varchar(7) NOT NULL default '',
  price decimal(10,2) NOT NULL default '0.00',
  stock int(11) NOT NULL default '0',
  sku varchar(60) NOT NULL default '',
  PRIMARY KEY  (spec_id),
  KEY goods_id (goods_id),
  KEY price (price)
) TYPE=MyISAM;
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('1','1','�ۺ�ɫ','XL','','99.00','99','G49B7B00DB597F-1');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('2','1','��ɫ','XL','','99.00','108','G49B7B00DB597F-2');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('3','1','��ɫ','XL','','99.00','108','G49B7B00DB597F-3');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('4','2','��ɫ','38','','188.00','100','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('5','2','��ɫ','39','','198.00','100','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('6','2','����ɫ','38','','188.00','80','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('7','2','����ɫ','39','','188.00','60','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('8','3','','','','238.00','20','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('9','4','','','','170.00','30','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('11','5','���׻�ɫ','39','','688.00','33','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('12','5','���׻�ɫ','40','','688.00','39','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('13','5','���׻�ɫ','41','','688.00','99','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('14','5','���׻�ɫ','42','','688.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('15','6','','','','170.00','90','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('16','7','��ɫ','����','','178.00','20','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('17','7','��ɫ','����','','178.00','30','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('19','8','��ɫ','36','','368.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('20','8','��ɫ','37','','368.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('21','8','��ɫ','38','','368.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('22','8','��ɫ','36','','368.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('23','8','��ɫ','37','','368.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('24','8','��ɫ','38','','368.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('25','9','','','','168.00','29','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('26','10','��ɫ','S','','170.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('27','10','��ɫ','M','','170.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('28','10','��ɫ','X','','170.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('29','10','��ɫ','XL','','170.00','10','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('30','11','�ۺ�','36','','268.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('31','11','�ۺ�','37','','268.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('32','11','�ۺ�','38','','268.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('33','11','�ۺ�','39','','268.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('34','12','','','','268.00','29','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('35','13','','','','179.00','500','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('37','14','','','','125.00','33','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('38','15','��ɫ','36','','578.00','92','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('39','15','��ɫ','37','','578.00','92','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('40','15','��ɫ','38','','578.00','92','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('41','15','��ɫ','39','','578.00','92','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('42','16','�����ɫ','37','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('43','16','�����ɫ','38','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('44','16','�����ɫ','39','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('55','17','','','','90.00','82','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('47','18','','','','170.00','27','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('48','19','','','','170.00','86','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('49','20','����ɫ','M','','129.00','99','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('50','20','����ɫ','X','','129.00','99','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('51','20','��ɫ','M','','129.00','99','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('52','20','��ɫ','X','','129.00','98','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('53','20','�ۺ�ɫ','M','','129.00','99','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('54','20','�ۺ�ɫ','X','','129.00','99','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('56','21','','','','170.00','87','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('57','22','','','','111.00','33','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('58','23','','','','170.00','500','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('59','24','��ɫ','36','','169.00','887','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('60','24','��ɫ','37','','169.00','888','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('61','24','��ɫ','38','','169.00','888','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('62','24','��ɫ','39','','169.00','888','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('63','25','��ɫ','S','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('64','25','��ɫ','M','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('65','25','��ɫ','L','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('66','25','��ɫ','XL','','128.00','88','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('67','26','','','','89.00','98','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('68','27','����ɫ','M','','288.00','243','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('69','27','����ɫ','X','','288.00','282','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('70','27','����','M','','288.00','282','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('71','27','����','X','','288.00','282','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('73','28','','','','188.00','2220','');
INSERT INTO ecm_goods_spec ( `spec_id`, `goods_id`, `spec_1`, `spec_2`, `color_rgb`, `price`, `stock`, `sku` ) VALUES  ('74','29','','','','328.00','100','');
DROP TABLE IF EXISTS ecm_goods_statistics;
CREATE TABLE ecm_goods_statistics (
  goods_id int(10) unsigned NOT NULL default '0',
  views int(10) unsigned NOT NULL default '0',
  collects int(10) unsigned NOT NULL default '0',
  carts int(10) unsigned NOT NULL default '0',
  orders int(10) unsigned NOT NULL default '0',
  sales int(10) unsigned NOT NULL default '0',
  comments int(11) unsigned NOT NULL default '0',
  PRIMARY KEY  (goods_id)
) TYPE=MyISAM;
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('1','5','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('2','1','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('3','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('4','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('5','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('6','1','0','1','1','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('7','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('8','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('9','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('10','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('11','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('12','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('13','4','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('14','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('15','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('16','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('17','10','0','1','1','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('18','19','0','1','1','0','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('19','54','0','2','2','1','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('20','1','0','1','1','1','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('21','7','0','1','1','0','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('22','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('23','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('24','8','0','1','1','1','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('25','0','0','0','0','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('26','1','0','1','1','0','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('27','33','0','5','3','0','0');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('28','39','0','3','2','1','1');
INSERT INTO ecm_goods_statistics ( `goods_id`, `views`, `collects`, `carts`, `orders`, `sales`, `comments` ) VALUES  ('29','85','1','31','17','0','0');
DROP TABLE IF EXISTS ecm_groupbuy;
CREATE TABLE ecm_groupbuy (
  group_id int(10) unsigned NOT NULL auto_increment,
  group_name varchar(255) NOT NULL default '',
  group_desc varchar(255) NOT NULL default '',
  start_time int(10) unsigned NOT NULL default '0',
  end_time int(10) unsigned NOT NULL default '0',
  goods_id int(10) unsigned NOT NULL default '0',
  store_id int(10) unsigned NOT NULL default '0',
  spec_price text NOT NULL,
  min_quantity smallint(5) unsigned NOT NULL default '0',
  max_per_user smallint(5) unsigned NOT NULL default '0',
  state tinyint(3) unsigned NOT NULL default '0',
  recommended tinyint(3) unsigned NOT NULL default '0',
  views int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (group_id),
  KEY goods_id (goods_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_groupbuy_log;
CREATE TABLE ecm_groupbuy_log (
  group_id int(10) unsigned NOT NULL default '0',
  user_id int(10) unsigned NOT NULL default '0',
  user_name varchar(60) NOT NULL default '',
  quantity smallint(5) unsigned NOT NULL default '0',
  spec_quantity text NOT NULL,
  linkman varchar(60) NOT NULL default '',
  tel varchar(60) NOT NULL default '',
  order_id int(10) unsigned NOT NULL default '0',
  add_time int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (group_id,user_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_mail_queue;
CREATE TABLE ecm_mail_queue (
  queue_id int(11) unsigned NOT NULL auto_increment,
  mail_to varchar(150) NOT NULL default '',
  mail_encoding varchar(50) NOT NULL default '',
  mail_subject varchar(255) NOT NULL default '',
  mail_body text NOT NULL,
  priority tinyint(1) unsigned NOT NULL default '2',
  err_num tinyint(1) unsigned NOT NULL default '0',
  add_time int(11) NOT NULL default '0',
  lock_expiry int(11) NOT NULL default '0',
  PRIMARY KEY  (queue_id)
) TYPE=MyISAM;
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('70','buyer','gbk','���ֹ�ת���ʼ�֪ͨ','�û�seller��1400058121����ת����1���֡�','1','2','1400058121','1400115535');
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('71','buyer','gbk','���ֹ�ת���ʼ�֪ͨ','����1400058121ת���û�buyer1���֡�','1','2','1400058121','1400115535');
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('72','buyer','gbk','���ֹ�ת���ʼ�֪ͨ','�û�seller��1400115504����ת����1���֡�','1','1','1400115504','1400115535');
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('73','buyer','gbk','���ֹ�ת���ʼ�֪ͨ','����1400115504ת���û�buyer1���֡�','1','1','1400115504','1400115535');
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('69','buyer','gbk','���ֹ�ת���ʼ�֪ͨ','�û�seller��1400058013����ת����1���֡�','1','3','1400058013','1400115535');
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('67','buyer@ecmall.com','gbk','ECMall��ʾվ����:������ʾ������ȷ���յ���������֧���Ļ���','<p>�𾴵�buyer:</p>\r\n<p style=\"padding-left: 30px;\">�������׵ĵ�����ʾ�����Ѿ�ȷ�����յ������Ķ���1413149783�ĸ�������ĵȴ����ҷ�����</p>\r\n<p style=\"padding-left: 30px;\">�鿴������ϸ��Ϣ������������</p>\r\n<p style=\"padding-left: 30px;\"><a href=\"http://127.0.0.7/index.php?app=buyer_order&amp;act=view&amp;order_id=30\">http://127.0.0.7/index.php?app=buyer_order&amp;act=view&amp;order_id=30</a></p>\r\n<p style=\"text-align: right;\">ECMall��ʾվ</p>\r\n<p style=\"text-align: right;\">2014-05-12 10:06</p>','1','4','1399860393','1400115536');
INSERT INTO ecm_mail_queue ( `queue_id`, `mail_to`, `mail_encoding`, `mail_subject`, `mail_body`, `priority`, `err_num`, `add_time`, `lock_expiry` ) VALUES  ('68','buyer@ecmall.com','gbk','ECMall��ʾվ����:���Ķ���1413149783�ѷ���','<p>�𾴵�buyer:</p>\r\n<p style=\"padding-left: 30px;\">�������׵ĵ�����ʾ�����Ѿ������Ķ���1413149783�����ˣ���ע����ա�</p>\r\n<p style=\"padding-left: 30px;\">�������ţ�V00001</p>\r\n<p style=\"padding-left: 30px;\">�鿴������ϸ��Ϣ������������</p>\r\n<p style=\"padding-left: 30px;\"><a href=\"http://127.0.0.7/index.php?app=buyer_order&amp;act=view&amp;order_id=30\">http://127.0.0.7/index.php?app=buyer_order&amp;act=view&amp;order_id=30</a></p>\r\n<p style=\"text-align: right;\">ECMall��ʾվ</p>\r\n<p style=\"text-align: right;\">2014-05-12 10:06</p>','1','4','1399860400','1400115536');
DROP TABLE IF EXISTS ecm_member;
CREATE TABLE ecm_member (
  user_id int(10) unsigned NOT NULL auto_increment,
  user_name varchar(60) NOT NULL default '',
  email varchar(60) NOT NULL default '',
  `password` varchar(32) NOT NULL default '',
  real_name varchar(60) default NULL,
  gender tinyint(3) unsigned NOT NULL default '0',
  birthday date default NULL,
  phone_tel varchar(60) default NULL,
  phone_mob varchar(60) default NULL,
  im_qq varchar(60) default NULL,
  im_msn varchar(60) default NULL,
  im_skype varchar(60) default NULL,
  im_yahoo varchar(60) default NULL,
  im_aliww varchar(60) default NULL,
  reg_time int(10) unsigned default '0',
  last_login int(10) unsigned default NULL,
  last_ip varchar(15) default NULL,
  logins int(10) unsigned NOT NULL default '0',
  ugrade tinyint(3) unsigned NOT NULL default '0',
  portrait varchar(255) default NULL,
  outer_id int(10) unsigned NOT NULL default '0',
  activation varchar(60) default NULL,
  feed_config text NOT NULL,
  grade varchar(10) NOT NULL default '��ѻ�Ա',
  integral int(255) NOT NULL default '0',
  money int(255) NOT NULL default '0',
  bank int(255) NOT NULL,
  deposit varchar(255) NOT NULL default '��˾',
  td_int int(255) NOT NULL default '0',
  ad_ids varchar(255) NOT NULL,
  sfz varchar(255) NOT NULL,
  login int(11) NOT NULL default '1',
  use_time int(10) unsigned default '0',
  fxs varchar(255) NOT NULL,
  dls varchar(255) NOT NULL,
  PRIMARY KEY  (user_id),
  KEY user_name (user_name),
  KEY email (email),
  KEY outer_id (outer_id)
) TYPE=MyISAM;
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('1','admin','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f','','0',null,null,null,'','',null,null,null,'1399194023','1400117817','127.0.0.1','12','0',null,'0',null,'','��ѻ�Ա','100','1000','0','��˾','0','','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('2','tianwei','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f','','0',null,null,null,'','15102754945',null,null,null,'1399194053','1400141094','127.0.0.1','11','0',null,'0','42c21a6ebddedd3c976c7fee037e175a','','VIP��Ա','100','0','155555','buyer','0','','0','1','1402358400','buyer','seller');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('3','seller','seller@ecmall.com','e10adc3949ba59abbe56e057f20f883e','��������','0',null,null,null,'','15102754945',null,null,null,'1399194729','1400143019','127.0.0.1','29','0',null,'0',null,'','������','135','1000','0','��˾','17',',23,21','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('4','buyer','buyer@ecmall.com','e10adc3949ba59abbe56e057f20f883e','�������','0','0000-00-00',null,null,'','15102754945',null,null,null,'1399194729','1400141070','127.0.0.1','27','0',null,'0',null,'','������','1723','0','42011211','seller','20','','0','1','1431648000','','seller');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('11','tianwei007','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f','','0',null,null,null,'','15102754945',null,null,null,'1399363865','1400134933','127.0.0.1','2','0',null,'0',null,'','������','100','0','0','tianwei','0','','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('10','tianwei006','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f',null,'0',null,null,null,null,'15102754945',null,null,null,'1399363841','1399363841','127.0.0.1','1','0',null,'0',null,'','��ѻ�Ա','100','0','0','tianwei005','0','','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('7','tianwei003','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f','','0','0000-00-00',null,null,'','15102754945',null,null,null,'1399278957','1399278957','127.0.0.1','1','0',null,'0',null,'','VIP��Ա','100','0','0','��˾','0','','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('8','tianwei004','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f',null,'0',null,null,null,null,'15102754945',null,null,null,'1399361925','1399361925','127.0.0.1','1','0',null,'0',null,'','��ѻ�Ա','100','0','0','','0','','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('9','tianwei005','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f','','0',null,null,null,'','15102754945',null,null,null,'1399362176','1399363877','127.0.0.1','3','0',null,'0',null,'','VIP��Ա','100','0','0','��˾','0','','0','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('12','tianwei010','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f',null,'0',null,null,null,null,'15102754945',null,null,null,'1400059222','1400059222','127.0.0.1','1','0',null,'0',null,'','��ѻ�Ա','0','0','0','��˾','0','','2147483647','1','1431648000','','');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('35','tianwei002','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f',null,'0',null,null,null,null,'15102754945',null,null,null,'1400143008','1400143008','127.0.0.1','1','0',null,'0',null,'','��ѻ�Ա','0','0','0','tianwei','0','','430112199103211530','1','1431648000','buyer','seller');
INSERT INTO ecm_member ( `user_id`, `user_name`, `email`, `password`, `real_name`, `gender`, `birthday`, `phone_tel`, `phone_mob`, `im_qq`, `im_msn`, `im_skype`, `im_yahoo`, `im_aliww`, `reg_time`, `last_login`, `last_ip`, `logins`, `ugrade`, `portrait`, `outer_id`, `activation`, `feed_config`, `grade`, `integral`, `money`, `bank`, `deposit`, `td_int`, `ad_ids`, `sfz`, `login`, `use_time`, `fxs`, `dls` ) VALUES  ('34','tian001','254368480@qq.com','ec8905987b99c70a577510deb2e4e66f',null,'0',null,null,null,null,'15102754945',null,null,null,'1400142973','1400142973','127.0.0.1','1','0',null,'0',null,'','��ѻ�Ա','0','0','0','tianwei','0','','410112199103211530','1','1431648000','buyer','seller');
DROP TABLE IF EXISTS ecm_message;
CREATE TABLE ecm_message (
  msg_id int(10) unsigned NOT NULL auto_increment,
  from_id int(10) unsigned NOT NULL default '0',
  to_id int(10) unsigned NOT NULL default '0',
  title varchar(100) NOT NULL default '',
  content text NOT NULL,
  add_time int(10) unsigned NOT NULL default '0',
  last_update int(10) unsigned NOT NULL default '0',
  `new` tinyint(3) unsigned NOT NULL default '0',
  parent_id int(10) unsigned NOT NULL default '0',
  `status` tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (msg_id),
  KEY from_id (from_id),
  KEY to_id (to_id),
  KEY parent_id (parent_id)
) TYPE=MyISAM;
INSERT INTO ecm_message ( `msg_id`, `from_id`, `to_id`, `title`, `content`, `add_time`, `last_update`, `new`, `parent_id`, `status` ) VALUES  ('1','0','2','','123213','1399276181','1399276181','1','0','3');
INSERT INTO ecm_message ( `msg_id`, `from_id`, `to_id`, `title`, `content`, `add_time`, `last_update`, `new`, `parent_id`, `status` ) VALUES  ('8','0','4','','��ϲ�����ĵ����ѿ�ͨ���Ͽ����û����ķ�����Ʒ�ɡ�','1399360808','1399360808','0','0','3');
INSERT INTO ecm_message ( `msg_id`, `from_id`, `to_id`, `title`, `content`, `add_time`, `last_update`, `new`, `parent_id`, `status` ) VALUES  ('6','4','3','','123213','1399281655','1399281655','1','0','2');
INSERT INTO ecm_message ( `msg_id`, `from_id`, `to_id`, `title`, `content`, `add_time`, `last_update`, `new`, `parent_id`, `status` ) VALUES  ('7','4','1','','123123','1399281801','1399281801','0','0','3');
DROP TABLE IF EXISTS ecm_module;
CREATE TABLE ecm_module (
  module_id varchar(30) NOT NULL default '',
  module_name varchar(100) NOT NULL default '',
  module_version varchar(5) NOT NULL default '',
  module_desc text NOT NULL,
  module_config text NOT NULL,
  enabled tinyint(1) NOT NULL default '0',
  PRIMARY KEY  (module_id)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_navigation;
CREATE TABLE ecm_navigation (
  nav_id int(10) unsigned NOT NULL auto_increment,
  `type` varchar(10) NOT NULL default '',
  title varchar(60) NOT NULL default '',
  link varchar(255) NOT NULL default '',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  open_new tinyint(3) unsigned NOT NULL default '0',
  PRIMARY KEY  (nav_id)
) TYPE=MyISAM;
INSERT INTO ecm_navigation ( `nav_id`, `type`, `title`, `link`, `sort_order`, `open_new` ) VALUES  ('1','middle','׬����','index.php?app=ad','1','1');
INSERT INTO ecm_navigation ( `nav_id`, `type`, `title`, `link`, `sort_order`, `open_new` ) VALUES  ('2','middle','�̳ǹ���','index.php?app=article&cate_id=2','255','0');
INSERT INTO ecm_navigation ( `nav_id`, `type`, `title`, `link`, `sort_order`, `open_new` ) VALUES  ('3','middle','�̳ǰ���','index.php?app=article&cate_id=1','255','0');
DROP TABLE IF EXISTS ecm_order;
CREATE TABLE ecm_order (
  order_id int(10) unsigned NOT NULL auto_increment,
  order_sn varchar(20) NOT NULL default '',
  `type` varchar(10) NOT NULL default 'material',
  extension varchar(10) NOT NULL default '',
  seller_id int(10) unsigned NOT NULL default '0',
  seller_name varchar(100) default NULL,
  buyer_id int(10) unsigned NOT NULL default '0',
  buyer_name varchar(100) default NULL,
  buyer_email varchar(60) NOT NULL default '',
  `status` tinyint(3) unsigned NOT NULL default '0',
  add_time int(10) unsigned NOT NULL default '0',
  payment_id int(10) unsigned default NULL,
  payment_name varchar(100) default NULL,
  payment_code varchar(20) NOT NULL default '',
  out_trade_sn varchar(20) NOT NULL default '',
  pay_time int(10) unsigned default NULL,
  pay_message varchar(255) NOT NULL default '',
  ship_time int(10) unsigned default NULL,
  invoice_no varchar(255) default NULL,
  finished_time int(10) unsigned NOT NULL default '0',
  goods_amount decimal(10,2) unsigned NOT NULL default '0.00',
  discount decimal(10,2) unsigned NOT NULL default '0.00',
  order_amount decimal(10,2) unsigned NOT NULL default '0.00',
  evaluation_status tinyint(1) unsigned NOT NULL default '0',
  evaluation_time int(10) unsigned NOT NULL default '0',
  anonymous tinyint(3) unsigned NOT NULL default '0',
  postscript varchar(255) NOT NULL default '',
  pay_alter tinyint(1) unsigned NOT NULL default '0',
  int_amount int(255) NOT NULL default '0',
  PRIMARY KEY  (order_id),
  KEY order_sn (order_sn,seller_id),
  KEY seller_name (seller_name),
  KEY buyer_name (buyer_name),
  KEY add_time (add_time)
) TYPE=MyISAM;
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('1','0921861930','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1249611845','2','���л��','bank','',null,'�Ѹ���100Ԫ',null,null,'0','170.00','0.00','175.00','0','0','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('2','0921820055','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611887','1','��������','cod','','1249612115','','1249612111','33333333','1249612115','170.00','0.00','180.00','1','1249612248','0','�뾡�췢��','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('3','0921801993','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611902','2','���л��','bank','','1249612096','���ѻ��','1249612102','cccc3333','1249612221','170.00','0.00','190.00','1','1249612230','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('4','0921847484','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611932','2','���л��','bank','','1249612086','�Ѹ���','1249612092','dddd2222','1249612205','129.00','0.00','134.00','1','1249612217','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('5','0921838115','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611951','1','��������','cod','','1249612081','','1249612077','dddd2222','1249612081','170.00','0.00','180.00','1','1249612201','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('6','0921877812','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611968','2','���л��','bank','','1249612054','�Ѹ���','1249612058','aaaaa','1249612171','169.00','0.00','174.00','1','1249612188','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('7','0921848095','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611987','1','��������','cod','','1249612050','','1249612042','abcd1234','1249612050','89.00','0.00','99.00','1','1249612167','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('8','0921855800','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','40','1249611999','2','���л��','bank','','1249612021','�Ѹ���','1249612031','abcd1234','1249612132','188.00','0.00','208.00','1','1249612152','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('9','1412395371','material','normal','3','��ʾ����','2','tianwei','254368480@qq.com','11','1399195005',null,null,'','',null,'',null,null,'0','90.00','0.00','95.00','0','0','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('10','1412423236','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','11','1399277768',null,null,'','',null,'',null,null,'0','188.00','0.00','193.00','0','0','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('11','1412676057','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','20','1399431282','2','���л��','bank','','1399431381','123213213',null,null,'0','8640.00','0.00','8790.00','0','0','0','','0','0');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('12','1412670326','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','20','1399433693',null,null,'','','1399597982','',null,null,'0','1640.00','0.00','1665.00','0','0','0','','0','500');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('13','1412622854','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','20','1399434211','2','���л��','bank','','1399597951','123',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('14','1412731111','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','20','1399539315',null,null,'','','1399597920','',null,null,'0','1152.00','0.00','1172.00','0','0','0','','0','800');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('15','1412706551','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','20','1399539916',null,null,'','','1399597871','',null,null,'0','2752.00','0.00','2797.00','0','0','0','','0','1400');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('16','1412744582','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399540151','2','���л��','bank','','1399597817','',null,null,'0','3280.00','0.00','3330.00','0','0','0','','0','1000');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('17','1412834530','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399597723',null,null,'','','1399597797','',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('18','1412884020','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','11','1399600050','2','���л��','bank','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('19','1412898651','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','11','1399600410','2','���л��','bank','',null,'123',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('20','1412851225','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399601054',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('21','1412801019','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399602628',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('22','1412841552','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399603632',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('23','1412829145','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399603707',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('24','1412812596','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399604360',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('25','1412829753','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399604436',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('26','1412889116','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399604553',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('27','1412874319','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399604612',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('28','1412857126','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399604901',null,null,'','',null,'',null,null,'0','328.00','0.00','333.00','0','0','0','','0','100');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('29','1412863555','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','0','1399604967',null,null,'','',null,'',null,null,'0','984.00','0.00','999.00','0','0','0','','0','300');
INSERT INTO ecm_order ( `order_id`, `order_sn`, `type`, `extension`, `seller_id`, `seller_name`, `buyer_id`, `buyer_name`, `buyer_email`, `status`, `add_time`, `payment_id`, `payment_name`, `payment_code`, `out_trade_sn`, `pay_time`, `pay_message`, `ship_time`, `invoice_no`, `finished_time`, `goods_amount`, `discount`, `order_amount`, `evaluation_status`, `evaluation_time`, `anonymous`, `postscript`, `pay_alter`, `int_amount` ) VALUES  ('30','1413149783','material','normal','3','��ʾ����','4','buyer','buyer@ecmall.com','30','1399860304','2','���л��','bank','','1399860393','123','1399860400','V00001','0','170.00','0.00','175.00','0','0','0','','0','0');
DROP TABLE IF EXISTS ecm_order_extm;
CREATE TABLE ecm_order_extm (
  order_id int(10) unsigned NOT NULL default '0',
  consignee varchar(60) NOT NULL default '',
  region_id int(10) unsigned default NULL,
  region_name varchar(255) default NULL,
  address varchar(255) default NULL,
  zipcode varchar(20) default NULL,
  phone_tel varchar(60) default NULL,
  phone_mob varchar(60) default NULL,
  shipping_id int(10) unsigned default NULL,
  shipping_name varchar(100) default NULL,
  shipping_fee decimal(10,2) NOT NULL default '0.00',
  PRIMARY KEY  (order_id),
  KEY consignee (consignee)
) TYPE=MyISAM;
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('1','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('2','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','2','���','10.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('3','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','3','EMS','20.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('4','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('5','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','2','���','10.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('6','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('7','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','2','���','10.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('8','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','3','EMS','20.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('9','��ΰ','2','�й�','�人','430040','','15102754945','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('10','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('11','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','150.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('12','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','25.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('13','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('14','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','20.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('15','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','45.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('16','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','50.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('17','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('18','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('19','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('20','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('21','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('22','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('23','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('24','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('25','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('26','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('27','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('28','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('29','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','15.00');
INSERT INTO ecm_order_extm ( `order_id`, `consignee`, `region_id`, `region_name`, `address`, `zipcode`, `phone_tel`, `phone_mob`, `shipping_id`, `shipping_name`, `shipping_fee` ) VALUES  ('30','��������','43','�й�	�Ϻ���	�����','����·15��','200088','021-88886666','13366669999','1','ƽ��','5.00');
DROP TABLE IF EXISTS ecm_order_goods;
CREATE TABLE ecm_order_goods (
  rec_id int(10) unsigned NOT NULL auto_increment,
  order_id int(10) unsigned NOT NULL default '0',
  goods_id int(10) unsigned NOT NULL default '0',
  goods_name varchar(255) NOT NULL default '',
  spec_id int(10) unsigned NOT NULL default '0',
  specification varchar(255) default NULL,
  price decimal(10,2) unsigned NOT NULL default '0.00',
  quantity int(10) unsigned NOT NULL default '1',
  goods_image varchar(255) default NULL,
  evaluation tinyint(1) unsigned NOT NULL default '0',
  `comment` varchar(255) NOT NULL default '',
  credit_value tinyint(1) NOT NULL default '0',
  is_valid tinyint(1) unsigned NOT NULL default '1',
  integral int(255) NOT NULL default '0',
  PRIMARY KEY  (rec_id),
  KEY order_id (order_id,goods_id)
) TYPE=MyISAM;
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('1','1','6','���ʺ��澭�䳤��ѩ���°���֯����ȹ','15','','170.00','1','data/files/store_2/goods_95/small_200908060841358079.jpg','0','','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('2','2','18','����֯��Ů����ȹŮװ','47','','170.00','1','data/files/store_2/goods_195/small_200908060936352784.jpg','3','���ͺܺã���������','1','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('3','3','19','����OL������˿ѩ�İ���ȹ��֯����ȹ','48','','170.00','1','data/files/store_2/goods_109/small_200908060938292631.jpg','3','�����ܿ죬�Һ�����','1','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('4','4','20','С��ţ��Ǧ�ʿ�','52','��ɫ:��ɫ ����:X','129.00','1','data/files/store_2/goods_143/small_200908060942233830.jpg','3','�������ǽ�һ���ÿ�','1','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('5','5','21','09�����¿��Լ�󷽸���������֯����ȹ983������','56','','170.00','1','data/files/store_2/goods_25/small_200908060950258122.jpg','3','�����ܲ���','1','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('6','6','24','���ϴ�˹��ʽ�˶�Ь','59','��ɫ:��ɫ ����:36','169.00','1','data/files/store_2/goods_20/small_200908060957002218.jpg','3','����̫����ˣ�����Ҳ��','1','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('7','7','26','ϲƤ���ţ�ж̿�','67','','89.00','1','data/files/store_2/goods_47/small_200908061000474424.jpg','2','û�������еĺ�','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('8','8','28','ŷ�����������߷���������װ��ˮ��Բ����С����','73','','188.00','1','data/files/store_2/goods_115/small_200908061005154170.jpg','3','���Ϻܺÿ����۸�Ҳʵ��','1','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('9','9','17','��E��ٴ�����������г��㡾��ɫ��','55','','90.00','1','data/files/store_2/goods_121/small_200908060932011437.jpg','0','','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('10','10','28','ŷ�����������߷���������װ��ˮ��Բ����С����','73','','188.00','1','data/files/store_2/goods_115/small_200908061005154170.jpg','0','','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('11','11','27','�����������п�','68','��ɫ:����ɫ ����:M','288.00','30','data/files/store_2/goods_5/small_200908061003253339.jpg','0','','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('12','12','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','5','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('13','13','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','0');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('14','14','27','�����������п�','68','��ɫ:����ɫ ����:M','288.00','4','data/files/store_2/goods_5/small_200908061003253339.jpg','0','','0','1','200');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('15','15','27','�����������п�','68','��ɫ:����ɫ ����:M','288.00','5','data/files/store_2/goods_5/small_200908061003253339.jpg','0','','0','1','200');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('16','15','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','4','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('17','16','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','10','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('18','17','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('19','18','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('20','19','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('21','20','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('22','21','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('23','22','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('24','23','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('25','24','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('26','25','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('27','26','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('28','27','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('29','28','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','1','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('30','29','29','�п�.�����¿�09����С�������¶��������ݴ�װ','74','','328.00','3','data/files/store_2/goods_121/small_200908061008412008.jpg','0','','0','1','100');
INSERT INTO ecm_order_goods ( `rec_id`, `order_id`, `goods_id`, `goods_name`, `spec_id`, `specification`, `price`, `quantity`, `goods_image`, `evaluation`, `comment`, `credit_value`, `is_valid`, `integral` ) VALUES  ('31','30','19','����OL������˿ѩ�İ���ȹ��֯����ȹ','48','','170.00','1','data/files/store_2/goods_109/small_200908060938292631.jpg','0','','0','1','0');
DROP TABLE IF EXISTS ecm_order_log;
CREATE TABLE ecm_order_log (
  log_id int(10) unsigned NOT NULL auto_increment,
  order_id int(10) unsigned NOT NULL default '0',
  operator varchar(60) NOT NULL default '',
  order_status varchar(60) NOT NULL default '',
  changed_status varchar(60) NOT NULL default '',
  remark varchar(255) default NULL,
  log_time int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (log_id),
  KEY order_id (order_id)
) TYPE=MyISAM;
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('1','8','seller','������','������','','1249612021');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('2','8','seller','������','�ѷ���','','1249612031');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('3','7','seller','���ύ','������','','1249612038');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('4','7','seller','������','�ѷ���','','1249612042');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('5','7','seller','�ѷ���','�����','','1249612050');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('6','6','seller','������','������','','1249612054');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('7','6','seller','������','�ѷ���','','1249612058');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('8','5','seller','���ύ','������','','1249612069');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('9','5','seller','������','�ѷ���','','1249612077');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('10','5','seller','�ѷ���','�����','','1249612081');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('11','4','seller','������','������','','1249612086');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('12','4','seller','������','�ѷ���','','1249612092');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('13','3','seller','������','������','','1249612096');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('14','3','seller','������','�ѷ���','','1249612102');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('15','2','seller','���ύ','������','','1249612106');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('16','2','seller','������','�ѷ���','','1249612111');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('17','2','seller','�ѷ���','�����','','1249612115');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('18','1','seller','������','��ȡ��','������Ч�Ķ���','1249612121');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('19','8','buyer','�ѷ���','�����','���ȷ���ջ�','1249612132');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('20','6','buyer','�ѷ���','�����','���ȷ���ջ�','1249612171');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('21','4','buyer','�ѷ���','�����','���ȷ���ջ�','1249612205');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('22','3','buyer','�ѷ���','�����','���ȷ���ջ�','1249612221');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('23','11','seller','������','������','','1399431381');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('24','17','seller','������','��ȡ��','������Ч�Ķ���','1399597849');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('25','16','seller','������','��ȡ��','������Ч�Ķ���','1399597854');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('26','14','seller','������','������','','1399597920');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('27','20','buyer','������','��ȡ��','��ѡ������Ʒ','1399603576');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('28','22','buyer','������','��ȡ��','��ѡ������Ʒ','1399603640');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('29','23','buyer','������','��ȡ��','��ѡ������Ʒ','1399603719');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('30','24','buyer','��ȡ��','��ȡ��','��ѡ������Ʒ','1399604371');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('31','25','buyer','��ȡ��','��ȡ��','��ѡ������Ʒ','1399604446');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('32','26','buyer','������','��ȡ��','��ѡ������Ʒ','1399604567');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('33','27','buyer','������','��ȡ��','��ѡ������Ʒ','1399604619');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('34','28','buyer','������','��ȡ��','��ѡ������Ʒ','1399604908');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('35','29','seller','������','��ȡ��','�޷��������','1399606500');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('36','29','seller','������','��ȡ��','�޷��������','1399606593');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('37','28','seller','������','��ȡ��','�޷��������','1399606671');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('38','29','seller','������','��ȡ��','�޷��������','1399606671');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('39','29','seller','������','��ȡ��','��Ǯ���㣬��������','1399606724');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('40','30','seller','������','������','123','1399860393');
INSERT INTO ecm_order_log ( `log_id`, `order_id`, `operator`, `order_status`, `changed_status`, `remark`, `log_time` ) VALUES  ('41','30','seller','������','�ѷ���','123','1399860400');
DROP TABLE IF EXISTS ecm_pageview;
CREATE TABLE ecm_pageview (
  rec_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  view_date date NOT NULL default '0000-00-00',
  view_times int(10) unsigned NOT NULL default '1',
  PRIMARY KEY  (rec_id),
  UNIQUE KEY storedate (store_id,view_date)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_partner;
CREATE TABLE ecm_partner (
  partner_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  title varchar(100) NOT NULL default '',
  link varchar(255) NOT NULL default '',
  logo varchar(255) default NULL,
  sort_order tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (partner_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
INSERT INTO ecm_partner ( `partner_id`, `store_id`, `title`, `link`, `logo`, `sort_order` ) VALUES  ('2','3','ECMall','http://ecmall.shopex.cn',null,'1');
INSERT INTO ecm_partner ( `partner_id`, `store_id`, `title`, `link`, `logo`, `sort_order` ) VALUES  ('3','3','ECShop','http://www.ecshop.com',null,'2');
INSERT INTO ecm_partner ( `partner_id`, `store_id`, `title`, `link`, `logo`, `sort_order` ) VALUES  ('5','0','֧����','http://www.alipay.com','data/files/mall/partner/5.gif','2');
INSERT INTO ecm_partner ( `partner_id`, `store_id`, `title`, `link`, `logo`, `sort_order` ) VALUES  ('6','0','�Ƹ�ͨ','http://www.tenpay.com','data/files/mall/partner/6.PNG','3');
DROP TABLE IF EXISTS ecm_payment;
CREATE TABLE ecm_payment (
  payment_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  payment_code varchar(20) NOT NULL default '',
  payment_name varchar(100) NOT NULL default '',
  payment_desc varchar(255) default NULL,
  config text,
  is_online tinyint(3) unsigned NOT NULL default '1',
  enabled tinyint(3) unsigned NOT NULL default '1',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (payment_id),
  KEY store_id (store_id),
  KEY payment_code (payment_code)
) TYPE=MyISAM;
INSERT INTO ecm_payment ( `payment_id`, `store_id`, `payment_code`, `payment_name`, `payment_desc`, `config`, `is_online`, `enabled`, `sort_order` ) VALUES  ('1','3','cod','��������','�ͻ����ţ������󸶿�','','0','1','2');
INSERT INTO ecm_payment ( `payment_id`, `store_id`, `payment_code`, `payment_name`, `payment_desc`, `config`, `is_online`, `enabled`, `sort_order` ) VALUES  ('2','3','bank','���л��','�й��������� 955880001118282828 ���ϰ�\r\n�й�ũҵ���� 138292992992929292 ���ϰ�','','0','1','1');
DROP TABLE IF EXISTS ecm_privilege;
CREATE TABLE ecm_privilege (
  priv_code varchar(20) NOT NULL default '',
  priv_name varchar(60) NOT NULL default '',
  parent_code varchar(20) default NULL,
  owner varchar(10) NOT NULL default 'mall',
  PRIMARY KEY  (priv_code)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_recode;
CREATE TABLE ecm_recode (
  id int(255) NOT NULL auto_increment,
  touser varchar(255) NOT NULL,
  fromuser varchar(255) NOT NULL,
  integral int(255) NOT NULL,
  `time` int(255) NOT NULL,
  content varchar(255) NOT NULL default 'ת��',
  PRIMARY KEY  (id)
) TYPE=MyISAM;
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('1','seller','buyer','10','1399348789','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('2','seller','buyer','10','1399348872','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('3','seller','buyer','10','1399355768','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('4','seller','buyer','10','1399355824','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('5','seller','buyer','20','1399357935','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('6','seller','buyer','30','1399357943','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('7','seller','buyer','40','1399357952','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('8','buyer','seller','10','1399359531','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('9','buyer','seller','1','1400058013','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('10','buyer','seller','1','1400058121','ת��');
INSERT INTO ecm_recode ( `id`, `touser`, `fromuser`, `integral`, `time`, `content` ) VALUES  ('11','buyer','seller','1','1400115504','ת��');
DROP TABLE IF EXISTS ecm_recommend;
CREATE TABLE ecm_recommend (
  recom_id int(10) unsigned NOT NULL auto_increment,
  recom_name varchar(100) NOT NULL default '',
  store_id int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (recom_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('15','ȹ��2','0');
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('14','ȹ��1','0');
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('13','����2','0');
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('12','����1','0');
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('11','��Ʒ','0');
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('10','�ؼ�2','0');
INSERT INTO ecm_recommend ( `recom_id`, `recom_name`, `store_id` ) VALUES  ('9','�ؼ�1','0');
DROP TABLE IF EXISTS ecm_recommended_goods;
CREATE TABLE ecm_recommended_goods (
  recom_id int(10) unsigned NOT NULL default '0',
  goods_id int(10) unsigned NOT NULL default '0',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (recom_id,goods_id)
) TYPE=MyISAM;
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','17','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','18','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','19','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','20','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','21','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','22','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','23','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','24','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','25','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','26','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('15','27','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('14','28','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('14','29','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('14','1','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('14','2','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('14','3','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('14','4','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','5','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','6','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','7','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','8','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','9','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','10','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','11','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('13','12','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('12','13','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('12','14','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('12','15','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('12','16','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('11','17','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('11','18','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('11','19','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('11','20','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('11','21','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('11','22','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('10','23','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('10','24','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('10','25','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('10','26','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('9','27','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('9','28','255');
INSERT INTO ecm_recommended_goods ( `recom_id`, `goods_id`, `sort_order` ) VALUES  ('9','29','255');
DROP TABLE IF EXISTS ecm_region;
CREATE TABLE ecm_region (
  region_id int(10) unsigned NOT NULL auto_increment,
  region_name varchar(100) NOT NULL default '',
  parent_id int(10) unsigned NOT NULL default '0',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (region_id),
  KEY parent_id (parent_id)
) TYPE=MyISAM;
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('2','�й�','0','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('3','������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('4','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('5','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('6','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('7','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('8','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('9','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('10','��̨','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('11','ʯ��ɽ','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('12','��ͷ��','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('13','��ɽ','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('14','ͨ��','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('15','˳��','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('16','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('17','��ƽ','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('18','ƽ��','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('19','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('20','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('21','����','3','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('22','�����','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('23','��ƽ��','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('24','�Ӷ���','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('25','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('26','�Ͽ���','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('27','�ӱ���','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('28','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('29','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('30','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('31','�����','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('32','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('33','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('34','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('35','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('36','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('37','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('38','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('39','������','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('40','����','22','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('41','�Ϻ���','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('42','�ֶ�����','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('43','�����','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('44','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('45','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('46','բ����','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('47','�����','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('48','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('49','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('50','¬����','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('51','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('52','��ɽ��','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('53','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('54','�ζ���','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('55','��ɽ��','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('56','�ɽ���','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('57','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('58','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('59','������','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('60','�ϻ���','41','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('61','������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('62','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('63','��ɿ�','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('64','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('65','ɳƺ��','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('66','������','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('67','�ϰ�','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('68','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('69','�山','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('70','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('71','��������','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('72','������','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('73','��ʢ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('74','˫��','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('75','�뽭','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('76','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('77','ͭ��','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('78','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('79','�ٲ�','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('80','�ɽ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('81','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('82','�ϴ�','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('83','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('84','�ϴ�','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('85','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('86','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('87','ǭ��','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('88','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('89','��ƽ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('90','�ǿ�','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('91','�ᶼ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('92','�潭','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('93','��¡','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('94','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('95','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('96','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('97','���','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('98','��ɽ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('99','��Ϫ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('100','ʯ��','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('101','��ɽ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('102','����','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('103','��ˮ','61','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('104','�ӱ�ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('105','ʯ��ׯ','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('106','��ˮ','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('107','��ɽ','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('108','�ػʵ�','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('109','�żҿ�','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('110','�е�','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('111','����','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('112','����','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('113','��̨','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('114','����','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('115','�ȷ�','104','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('116','ɽ��ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('117','̫ԭ��','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('118','��ͬ��','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('119','˷����','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('120','������','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('121','������','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('122','��Ȫ��','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('123','������','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('124','������','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('125','������','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('126','�ٷ���','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('127','�˳���','116','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('128','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('129','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('130','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('131','��ɽ','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('132','��˳','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('133','��Ϫ','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('134','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('135','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('136','Ӫ��','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('137','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('138','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('139','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('140','����','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('141','�̽�','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('142','��«��','128','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('143','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('144','������','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('145','������','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('146','��ƽ��','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('147','��Դ��','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('148','ͨ����','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('149','��ɽ��','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('150','��ԭ��','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('151','�׳���','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('152','�ӱ���','143','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('153','������ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('154','������','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('155','�������','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('156','ĵ����','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('157','��ľ˹','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('158','����','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('159','����','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('160','����','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('161','˫Ѽɽ','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('162','��̨��','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('163','�׸�','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('164','�ں�','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('165','�绯','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('166','���˰���','153','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('167','���ɹ�������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('168','���ͺ�����','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('169','��ͷ��','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('170','�ں���','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('171','�����','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('172','ͨ����','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('173','������˹��','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('174','���ױ�����','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('175','�����׶���','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('176','�����첼��','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('177','���ֹ�����','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('178','�˰���','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('179','��������','167','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('180','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('181','�Ͼ�','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('182','����','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('183','����','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('184','����','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('185','����','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('186','��ͨ','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('187','��','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('188','̩��','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('189','����','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('190','����','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('191','�γ�','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('192','��Ǩ','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('193','���Ƹ�','180','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('194','�㽭ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('195','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('196','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('197','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('198','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('199','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('200','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('201','��','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('202','����','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('203','��ɽ','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('204','̨��','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('205','��ˮ','194','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('206','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('207','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('208','�Ϸ���','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('209','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('210','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('211','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('212','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('213','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('214','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('215','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('216','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('217','�ߺ���','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('218','��ɽ','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('219','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('220','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('221','ͭ����','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('222','������','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('223','��ɽ��','206','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('224','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('225','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('226','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('227','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('228','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('229','Ȫ����','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('230','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('231','��ƽ��','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('232','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('233','������','224','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('234','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('235','�ϲ���','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('236','��������','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('237','Ƽ����','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('238','�Ž���','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('239','������','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('240','ӥ̶��','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('241','������','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('242','������','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('243','�˴���','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('244','������','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('245','������','234','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('246','ɽ��ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('247','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('248','�ൺ','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('249','�Ͳ�','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('250','̩��','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('251','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('252','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('253','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('254','Ϋ��','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('255','��ׯ','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('256','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('257','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('258','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('259','�ĳ�','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('260','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('261','��̨','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('262','����','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('263','��Ӫ','246','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('264','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('265','֣����','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('266','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('267','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('268','ƽ��ɽ��','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('269','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('270','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('271','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('272','��Դ��','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('273','�ܿ���','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('274','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('275','פ�����','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('276','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('277','�ױ���','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('278','������','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('279','�����','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('280','�����','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('281','����Ͽ��','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('282','�����','264','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('283','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('284','�人','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('285','�˲�','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('286','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('287','ʮ��','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('288','�差','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('289','��ʯ','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('290','�Ƹ�','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('291','��ʩ','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('292','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('293','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('294','Т��','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('295','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('296','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('297','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('298','����','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('299','Ǳ��','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('300','��ũ��','283','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('301','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('302','��ɳ��','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('303','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('304','��̶��','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('305','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('306','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('307','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('308','¦����','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('309','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('310','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('311','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('312','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('313','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('314','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('315','�żҽ�','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('316','������','301','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('317','�㶫ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('318','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('319','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('320','�麣','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('321','��ͷ','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('322','��ɽ','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('323','��ݸ','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('324','��ɽ','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('325','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('326','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('327','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('328','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('329','�ع�','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('330','��Դ','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('331','÷��','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('332','��Զ','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('333','�Ƹ�','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('334','ï��','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('335','��β','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('336','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('337','����','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('338','տ��','317','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('339','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('340','������','339','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('341','������','339','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('342','����׳��������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('343','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('344','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('345','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('346','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('347','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('348','���Ǹ�','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('349','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('350','���','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('351','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('352','��ɫ','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('353','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('354','�ӳ�','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('355','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('356','����','342','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('357','�Ĵ�ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('358','�ɶ�','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('359','�Թ�','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('360','��֦��','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('361','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('362','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('363','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('364','��Ԫ','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('365','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('366','�ڽ�','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('367','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('368','��ɽ','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('369','üɽ','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('370','�ϳ�','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('371','�˱�','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('372','�㰲','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('373','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('374','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('375','�Ű�','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('376','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('377','����','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('378','��ɽ','357','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('379','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('380','������','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('381','������','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('382','��˳��','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('383','����ˮ��','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('384','�Ͻڵ���','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('385','ͭ�ʵ���','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('386','ǭ������','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('387','ǭ����','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('388','ǭ������','379','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('389','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('390','������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('391','������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('392','��ӹ���������������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('393','��ͨ��','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('394','��Ϫ��','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('395','�º���徰����������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('396','������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('397','�������������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('398','��ɽ׳������������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('399','˼é��','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('400','�������������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('401','ŭ��������������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('402','��ɽ��','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('403','��������������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('404','��˫���ɴ���������','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('405','�ٲ���','389','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('406','����������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('407','����','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('408','�տ���','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('409','��֥','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('410','ɽ��','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('411','����','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('412','����','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('413','����','406','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('414','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('415','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('416','ͭ����','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('417','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('418','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('419','μ����','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('420','�Ӱ���','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('421','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('422','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('423','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('424','������','414','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('425','����ʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('426','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('427','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('428','�����','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('429','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('430','��ˮ��','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('431','��Ȫ��','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('432','��Ҵ��','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('433','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('434','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('435','¤����','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('436','ƽ����','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('437','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('438','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('439','������','425','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('440','�ຣʡ','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('441','������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('442','��������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('443','��������������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('444','���ϲ���������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('445','������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('446','���ϲ���������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('447','��������������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('448','�������������','440','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('449','���Ļ���������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('450','������','449','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('451','ʯ��ɽ��','449','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('452','������','449','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('453','��ԭ��','449','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('454','������','449','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('455','�½�ά���������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('456','���������������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('457','��³ľ����','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('458','��������������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('459','ʯ������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('460','����������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('461','����̩����','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('462','���������ɹ�������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('463','���ǵ���','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('464','�������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('465','�������տ˶�����������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('466','��ʲ����','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('467','�����յ���','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('468','���������ɹ�������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('469','��³������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('470','���ܵ���','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('471','�������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('472','��������','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('473','ͼľ�����','455','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('474','����ر�������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('475','�����ر�������','2','255');
INSERT INTO ecm_region ( `region_id`, `region_name`, `parent_id`, `sort_order` ) VALUES  ('476','̨��ʡ','2','255');
DROP TABLE IF EXISTS ecm_scategory;
CREATE TABLE ecm_scategory (
  cate_id int(10) unsigned NOT NULL auto_increment,
  cate_name varchar(100) NOT NULL default '',
  parent_id int(10) unsigned NOT NULL default '0',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (cate_id),
  KEY parent_id (parent_id)
) TYPE=MyISAM;
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('1','����','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('2','Ůװ/Ůʿ��Ʒ','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('3','��װ','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('4','ŮЬ','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('5','������Ь','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('6','�˶�Ь','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('7','Ůʿ����/��ʿ����/�Ҿӷ�','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('8','���Ƥ��/����Ů��/�а�','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('9','�˶���/�˶���/�������','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('10','�������/Ƥ��/ñ��/Χ��','1','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('11','�ֻ�/����/�칫/�ҵ�','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('12','�ֻ�','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('13','������Ʒ�ֻ�','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('14','�ʼǱ�����','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('15','����Ӳ��/̨ʽ����/�����豸','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('16','MP3/MP4/iPod/¼����','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('17','�������/�����/ͼ�γ�ӡ','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('18','3C��������г�','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('19','�������/�������','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('20','���濨/U��/�ƶ��洢','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('21','����/���/��Ϸ/����','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('22','�칫�豸/�ľ�/�Ĳ�','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('23','Ӱ������','11','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('24','���ݻ���/���˻���','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('25','���ݻ���/����/����','24','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('26','��ױ/��ˮ/����/����','24','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('27','���˻���/����/��Ħ����','24','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('28','�Ҿ�/ĸӤ/ʳƷ','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('29','�Ӽ�����/��������/��ԡϴԡ','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('30','ʱ�м���/����Ʒ/ʮ����','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('31','�Ҿ�/�Ҿ߶���/�˼Ҵ���','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('32','�ҷ�/��Ʒ/��̺/����','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('33','װ��/�ƾ�/���/����/��ԡ','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('34','����ʳƷ','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('35','ʳƷ/��Ҷ/��ʳ/�ز�','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('36','�̷�/��Ƭ/ĸӤ��Ʒ','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('37','�������/ͯ��/ͯ��/���','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('38','ͯװ/ͯЬ/�и�װ','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('39','����/����ʳƷ����Ʒ','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('40','��������','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('41','�������','28','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('42','����/����','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('43','�鼮/��־/��ֽ','42','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('44','����/Ӱ��/����/����','42','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('45','�˶�/�٤/����/������Ʒ','42','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('46','����/��ɽ/ҰӪ/��ˮ','42','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('47','����/���/��װ/Ħ��/���г�','42','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('48','�鱦/����','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('49','��Ʒ/��������/ʱ����Ʒ','48','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('50','�鱦/��ʯ/���/�ƽ�','48','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('51','Ʒ���ֱ�/�����ֱ�','48','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('52','�ղ�/����','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('53','�Ŷ�/�ʱ�/�ֻ�/�ղ�','52','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('54','���/ģ��/����/��ż','52','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('55','ZIPPO/��ʿ����/�۾�','52','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('56','��Ϸ/����','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('57','��ѶQQר��','56','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('58','����װ��/��Ϸ��/�ʺ�/����','56','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('59','������Ϸ�㿨','56','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('60','�ƶ�/��ͨ/С��ͨ��ֵ����','56','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('61','IP��/����绰/�ֻ�����','56','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('62','�������','0','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('63','������Ʒ/������Ʒ/��Ȥ����','62','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('64','����װ��/�������/ͼƬ�洢','62','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('65','�ʻ��ٵ�/��������/԰�ջ���','62','255');
INSERT INTO ecm_scategory ( `cate_id`, `cate_name`, `parent_id`, `sort_order` ) VALUES  ('66','�ݳ�/����/�Ժ������ۿ�ȯ','62','255');
DROP TABLE IF EXISTS ecm_sessions;
CREATE TABLE ecm_sessions (
  sesskey char(32) NOT NULL default '',
  expiry int(11) NOT NULL default '0',
  userid int(11) NOT NULL default '0',
  adminid int(11) NOT NULL default '0',
  ip char(15) NOT NULL default '',
  `data` char(255) NOT NULL default '',
  is_overflow tinyint(4) NOT NULL default '0',
  PRIMARY KEY  (sesskey),
  KEY expiry (expiry)
) TYPE=MyISAM;
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('d7de8ff92fa501f35a75f8acf8cafdcf','1400144418','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('d43c4d56c035db55c336f7728754f24e','1400144429','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('3401aa305d5b8cfb9f67185843c26446','1400144431','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('c37130d84ba29b3fdb17c5e848a6b949','1400144451','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('0679012a7501df4aa14025495bd011f2','1400145814','0','0','127.0.0.1','','1');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('9d95deaa1b3d9b1501c2f54d7cd3b75a','1400145763','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('7f055cabc6e0eae2704503d91ea823c6','1400145759','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('665993ca0bb3a8ede7b53a87c42849cc','1400145757','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('62450d2ec7ef0acfd4e16aebddb2d875','1400145756','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('834d59856cf13c0cfe7602de43810076','1400145755','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('82f1360f001aab2049d1d0c6ada2ee3d','1400145754','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('4af49c072e6e59f6247f299e477a5c6b','1400145752','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('640edfda2c67795f1d6265276a80a560','1400145750','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('f281373732c4d2e0eda5be4ef325fb09','1400144464','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('7da523a0b4d9b8e269e420911feb8b98','1400144455','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('e725606b3d9e230f49b13818e2415ed7','1400144452','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('fa0bb0a3211927adb29be966601293eb','1400142524','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('d5950584298e0bb0d32f0de8955fe75c','1400142504','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('738ac43de077156ca9b30c905171862d','1400142315','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('3604d2f9749acbeb04b166a142cc24e1','1400142312','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('2cd3ac01748435515da8bff7abd72ba6','1400142289','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('f623a89e72a501a4d231c609dba24429','1400141831','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('def47440ac764706d536aff7826df566','1400141508','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('194e933a48ac801210834aff091b81ed','1400141507','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('cc54a9365bf8a0a8db4fc6fcb20a5fb7','1400141487','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('395721cc0b89b4861358bd9874d2c004','1400141470','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('fb31ba28ef1dafb61d189963976c73ac','1400141196','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('18fb1e1fd7655b82cd85602e4caf826c','1400141194','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('96506fc156b0b8ee226d3b1d82230189','1400141173','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('5ca2f0c9c3a1d00656f94b539878e1d5','1400142538','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('16918611a67537f379da959c60331e0f','1400142550','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('27a931b3398af8cb181a775cf93ce82c','1400143719','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('3935771bc20581443da80dd488d63fe6','1400143779','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('783fbeb5559bc6057355bf09987e5ed4','1400144382','0','0','127.0.0.1','','0');
INSERT INTO ecm_sessions ( `sesskey`, `expiry`, `userid`, `adminid`, `ip`, `data`, `is_overflow` ) VALUES  ('39fbb1c971d817e92535e030d3bb0b00','1400144390','0','0','127.0.0.1','','0');
DROP TABLE IF EXISTS ecm_sessions_data;
CREATE TABLE ecm_sessions_data (
  sesskey varchar(32) NOT NULL default '',
  expiry int(11) NOT NULL default '0',
  `data` longtext NOT NULL,
  PRIMARY KEY  (sesskey),
  KEY expiry (expiry)
) TYPE=MyISAM;
INSERT INTO ecm_sessions_data ( `sesskey`, `expiry`, `data` ) VALUES  ('0679012a7501df4aa14025495bd011f2','1400145814','captcha|s:8:\"NTJlYw==\";admin_info|a:5:{s:7:\"user_id\";s:1:\"1\";s:9:\"user_name\";s:5:\"admin\";s:8:\"reg_time\";s:10:\"1399194023\";s:10:\"last_login\";s:10:\"1400030139\";s:7:\"last_ip\";s:9:\"127.0.0.1\";}user_info|a:6:{s:7:\"user_id\";s:1:\"3\";s:9:\"user_name\";s:6:\"seller\";s:8:\"reg_time\";s:10:\"1399194729\";s:10:\"last_login\";s:10:\"1400141105\";s:7:\"last_ip\";s:9:\"127.0.0.1\";s:8:\"store_id\";s:1:\"3\";}');
DROP TABLE IF EXISTS ecm_sgrade;
CREATE TABLE ecm_sgrade (
  grade_id tinyint(3) unsigned NOT NULL auto_increment,
  grade_name varchar(60) NOT NULL default '',
  goods_limit int(10) unsigned NOT NULL default '0',
  space_limit int(10) unsigned NOT NULL default '0',
  skin_limit int(10) unsigned NOT NULL default '0',
  charge varchar(100) NOT NULL default '',
  need_confirm tinyint(3) unsigned NOT NULL default '0',
  description varchar(255) NOT NULL default '',
  functions varchar(255) default NULL,
  skins text NOT NULL,
  sort_order tinyint(4) unsigned NOT NULL default '0',
  PRIMARY KEY  (grade_id)
) TYPE=MyISAM;
INSERT INTO ecm_sgrade ( `grade_id`, `grade_name`, `goods_limit`, `space_limit`, `skin_limit`, `charge`, `need_confirm`, `description`, `functions`, `skins`, `sort_order` ) VALUES  ('1','��ͨ�̼�','50','50','1','100Ԫ/��','1','������ĵ�ң�����ʱ��Ҫ�ϴ����֤��Ƭ��','editor_multimedia,coupon,groupbuy,enable_radar','default|default','255');
INSERT INTO ecm_sgrade ( `grade_id`, `grade_name`, `goods_limit`, `space_limit`, `skin_limit`, `charge`, `need_confirm`, `description`, `functions`, `skins`, `sort_order` ) VALUES  ('2','��֤����','200','1000','5','200Ԫ/��','1','����ʱ��Ҫ�ϴ����֤��Ӫҵִ�ո�ӡ��','editor_multimedia,coupon,groupbuy','default|default,default|style1,default|style2,default|style3,default|style4','255');
DROP TABLE IF EXISTS ecm_shipping;
CREATE TABLE ecm_shipping (
  shipping_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  shipping_name varchar(100) NOT NULL default '',
  shipping_desc varchar(255) default NULL,
  first_price decimal(10,2) NOT NULL default '0.00',
  step_price decimal(10,2) NOT NULL default '0.00',
  cod_regions text,
  enabled tinyint(3) unsigned NOT NULL default '1',
  sort_order tinyint(3) unsigned NOT NULL default '255',
  PRIMARY KEY  (shipping_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
INSERT INTO ecm_shipping ( `shipping_id`, `store_id`, `shipping_name`, `shipping_desc`, `first_price`, `step_price`, `cod_regions`, `enabled`, `sort_order` ) VALUES  ('1','3','ƽ��','��ͨ�����ʼ�','5.00','5.00',null,'1','255');
INSERT INTO ecm_shipping ( `shipping_id`, `store_id`, `shipping_name`, `shipping_desc`, `first_price`, `step_price`, `cod_regions`, `enabled`, `sort_order` ) VALUES  ('2','3','���','���ٿ�ݹ�˾','10.00','10.00','a:2:{i:3;s:11:\"�й�	������\";i:41;s:11:\"�й�	�Ϻ���\";}','1','1');
INSERT INTO ecm_shipping ( `shipping_id`, `store_id`, `shipping_name`, `shipping_desc`, `first_price`, `step_price`, `cod_regions`, `enabled`, `sort_order` ) VALUES  ('3','3','EMS','�й������ؿ�ר�ݣ�ȫ����Χ�ɴ�','20.00','10.00',null,'1','3');
DROP TABLE IF EXISTS ecm_store;
CREATE TABLE ecm_store (
  store_id int(10) unsigned NOT NULL default '0',
  store_name varchar(100) NOT NULL default '',
  owner_name varchar(60) NOT NULL default '',
  owner_card varchar(60) NOT NULL default '',
  region_id int(10) unsigned default NULL,
  region_name varchar(100) default NULL,
  address varchar(255) NOT NULL default '',
  zipcode varchar(20) NOT NULL default '',
  tel varchar(60) NOT NULL default '',
  sgrade tinyint(3) unsigned NOT NULL default '0',
  apply_remark varchar(255) NOT NULL default '',
  credit_value int(10) NOT NULL default '0',
  praise_rate decimal(5,2) unsigned NOT NULL default '0.00',
  domain varchar(60) default NULL,
  state tinyint(3) unsigned NOT NULL default '0',
  close_reason varchar(255) NOT NULL default '',
  add_time int(10) unsigned default NULL,
  end_time int(10) unsigned NOT NULL default '0',
  certification varchar(255) default NULL,
  sort_order smallint(5) unsigned NOT NULL default '0',
  recommended tinyint(4) NOT NULL default '0',
  theme varchar(60) NOT NULL default '',
  store_banner varchar(255) default NULL,
  store_logo varchar(255) default NULL,
  description text,
  image_1 varchar(255) NOT NULL default '',
  image_2 varchar(255) NOT NULL default '',
  image_3 varchar(255) NOT NULL default '',
  im_qq varchar(60) NOT NULL default '',
  im_ww varchar(60) NOT NULL default '',
  im_msn varchar(60) NOT NULL default '',
  enable_groupbuy tinyint(1) unsigned NOT NULL default '0',
  enable_radar tinyint(1) unsigned NOT NULL default '1',
  PRIMARY KEY  (store_id),
  KEY store_name (store_name),
  KEY owner_name (owner_name),
  KEY region_id (region_id),
  KEY domain (domain)
) TYPE=MyISAM;
INSERT INTO ecm_store ( `store_id`, `store_name`, `owner_name`, `owner_card`, `region_id`, `region_name`, `address`, `zipcode`, `tel`, `sgrade`, `apply_remark`, `credit_value`, `praise_rate`, `domain`, `state`, `close_reason`, `add_time`, `end_time`, `certification`, `sort_order`, `recommended`, `theme`, `store_banner`, `store_logo`, `description`, `image_1`, `image_2`, `image_3`, `im_qq`, `im_ww`, `im_msn`, `enable_groupbuy`, `enable_radar` ) VALUES  ('3','��ʾ����','���ϰ�','123456789012345678','9','�й�	������	����','������16��','100088','010-88886666-8866','2','','6','85.71','','1','','1249543819','0','','0','1','default|default',null,null,'','','','','','','','0','1');
INSERT INTO ecm_store ( `store_id`, `store_name`, `owner_name`, `owner_card`, `region_id`, `region_name`, `address`, `zipcode`, `tel`, `sgrade`, `apply_remark`, `credit_value`, `praise_rate`, `domain`, `state`, `close_reason`, `add_time`, `end_time`, `certification`, `sort_order`, `recommended`, `theme`, `store_banner`, `store_logo`, `description`, `image_1`, `image_2`, `image_3`, `im_qq`, `im_ww`, `im_msn`, `enable_groupbuy`, `enable_radar` ) VALUES  ('4','�ҵĵ���','tianwei','420112199103211530','284','�й�	����ʡ	�人','�人','430040','15102754945','1','','0','0.00',null,'1','','1399360808','0',null,'65535','0','',null,null,null,'','','','','','','0','1');
DROP TABLE IF EXISTS ecm_uploaded_file;
CREATE TABLE ecm_uploaded_file (
  file_id int(10) unsigned NOT NULL auto_increment,
  store_id int(10) unsigned NOT NULL default '0',
  file_type varchar(60) NOT NULL default '',
  file_size int(10) unsigned NOT NULL default '0',
  file_name varchar(255) NOT NULL default '',
  file_path varchar(255) NOT NULL default '',
  add_time int(10) unsigned NOT NULL default '0',
  belong tinyint(3) unsigned NOT NULL default '0',
  item_id int(10) unsigned NOT NULL default '0',
  PRIMARY KEY  (file_id),
  KEY store_id (store_id)
) TYPE=MyISAM;
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('3','3','image/jpeg','12362','e312229073211613.jpg','data/files/store_2/goods_179/200908060822598478.jpg','1249546979','2','1');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('4','3','image/jpeg','12719','4804c0f3850ea00f.jpg','data/files/store_2/goods_197/200908060823178267.jpg','1249546997','2','1');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('5','3','image/jpeg','7452','0debd9a9e2670ee3.jpg','data/files/store_2/goods_9/200908060823294001.jpg','1249547009','2','1');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('6','3','image/jpeg','11303','cdd6104486b110e6.jpg','data/files/store_2/goods_25/200908060823452419.jpg','1249547025','2','1');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('7','3','image/jpeg','11989','ab4ccb7023198236.jpg','data/files/store_2/goods_32/200908060823523184.jpg','1249547032','2','1');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('8','3','image/jpeg','9776','66253ee68af3b7c8.jpg','data/files/store_2/goods_43/200908060824034431.jpg','1249547043','2','1');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('9','3','image/jpeg','15810','20c422381519c2c2.jpg','data/files/store_2/goods_131/200908060828517782.jpg','1249547331','2','2');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('10','3','image/jpeg','17379','4139a3d3b0c4b37e.jpg','data/files/store_2/goods_150/200908060829102798.jpg','1249547350','2','2');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('11','3','image/jpeg','19656','42d91ab1b33192de.jpg','data/files/store_2/goods_170/200908060829308411.jpg','1249547370','2','2');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('12','3','image/jpeg','9576','b1b9851f8a31e92d.jpg','data/files/store_2/goods_107/200908060831473107.jpg','1249547507','2','3');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('13','3','image/jpeg','8929','bf4e91fd54345a9c.jpg','data/files/store_2/goods_115/200908060831559591.jpg','1249547515','2','3');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('14','3','image/jpeg','6114','45493a6f6fec84f2.jpg','data/files/store_2/goods_140/200908060832202677.jpg','1249547540','2','3');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('15','3','image/jpeg','6561','63510a7451dcacab.jpg','data/files/store_2/goods_147/200908060832272714.jpg','1249547548','2','3');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('16','3','image/jpeg','22367','8182647915c83d33.jpg','data/files/store_2/goods_66/200908060834263919.jpg','1249547666','2','4');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('17','3','image/jpeg','22319','37f593db08b31139.jpg','data/files/store_2/goods_87/200908060834479577.jpg','1249547687','2','4');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('18','3','image/jpeg','20131','816effe5591ca815.jpg','data/files/store_2/goods_105/200908060835054315.jpg','1249547705','2','4');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('19','3','image/jpeg','20031','45e6c54d9b324696.jpg','data/files/store_2/goods_125/200908060835258625.jpg','1249547725','2','4');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('20','3','image/jpeg','13511','a3836dd5e6541b68.jpg','data/files/store_2/goods_141/200908060835411590.jpg','1249547741','2','4');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('21','3','image/jpeg','19887','16b171b2bb9956a1.jpg','data/files/store_2/goods_155/200908060835558086.jpg','1249547755','2','4');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('22','3','image/jpeg','14406','81c4c33a4abe35a3.jpg','data/files/store_2/goods_70/200908060837502713.jpg','1249547870','2','5');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('23','3','image/jpeg','18618','ab46c77e6bf8c22a.jpg','data/files/store_2/goods_95/200908060841358079.jpg','1249548095','2','6');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('24','3','image/jpeg','19235','8f46f0a94d7d8e4b.jpg','data/files/store_2/goods_108/200908060841484621.jpg','1249548108','2','6');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('25','3','image/jpeg','20369','940f52830b31759a.jpg','data/files/store_2/goods_124/200908060842042302.jpg','1249548124','2','6');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('26','3','image/jpeg','10992','17035a2c04152769.jpg','data/files/store_2/goods_186/200908060906263554.jpg','1249549586','2','7');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('27','3','image/jpeg','11091','1ef4f5b42972ed6d.jpg','data/files/store_2/goods_13/200908060906532764.jpg','1249549613','2','7');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('28','3','image/jpeg','11786','849f0be16991cdf0.jpg','data/files/store_2/goods_36/200908060907164774.jpg','1249549636','2','7');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('29','3','image/jpeg','11795','1f142f7aca2b77ba.jpg','data/files/store_2/goods_187/200908060909472569.jpg','1249549787','2','8');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('30','3','image/jpeg','11602','0806158a947e9e0e.jpg','data/files/store_2/goods_2/200908060910023266.jpg','1249549802','2','8');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('31','3','image/jpeg','8543','03b2a4603b85e820.jpg','data/files/store_2/goods_98/200908060911381037.jpg','1249549898','2','9');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('32','3','image/jpeg','16022','521bf6e6c8589e5e.jpg','data/files/store_2/goods_128/200908060912082754.jpg','1249549928','2','9');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('33','3','image/jpeg','16935','7b57b81be56d8cb0.jpg','data/files/store_2/goods_69/200908060914291406.jpg','1249550069','2','10');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('34','3','image/jpeg','17495','47f458fa00e4a99f.jpg','data/files/store_2/goods_82/200908060914426191.jpg','1249550082','2','10');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('35','3','image/jpeg','13592','55217d17c0a54e5c.jpg','data/files/store_2/goods_94/200908060914542008.jpg','1249550094','2','10');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('36','3','image/jpeg','17705','63788145012d6b67.jpg','data/files/store_2/goods_126/200908060915269026.jpg','1249550126','2','10');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('37','3','image/jpeg','15711','95a200317cab0127.jpg','data/files/store_2/goods_33/200908060917132087.jpg','1249550233','2','11');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('38','3','image/jpeg','13899','f78e1c41eb90dad8.jpg','data/files/store_2/goods_123/200908060918436837.jpg','1249550323','2','12');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('39','3','image/jpeg','11798','c11d579c21a32178.jpg','data/files/store_2/goods_142/200908060919027810.jpg','1249550342','2','12');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('40','3','image/jpeg','11142','8aa9cf1cbb49a683.jpg','data/files/store_2/goods_24/200908060920245196.jpg','1249550424','2','13');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('41','3','image/jpeg','13472','3b108b157c7dc941.jpg','data/files/store_2/goods_43/200908060920437979.jpg','1249550443','2','13');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('42','3','image/jpeg','18693','39388f9f7b055bad.jpg','data/files/store_2/goods_54/200908060920546675.jpg','1249550454','2','13');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('43','3','image/jpeg','16603','0ff8c40a74c9a226.jpg','data/files/store_2/goods_128/200908060922084636.jpg','1249550528','2','14');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('44','3','image/jpeg','14549','7a8e22cc60f7096e.jpg','data/files/store_2/goods_141/200908060922218002.jpg','1249550541','2','14');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('45','3','image/jpeg','19331','587a5e6b23b02e02.jpg','data/files/store_2/goods_29/200908060923496883.jpg','1249550629','2','14');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('46','3','image/jpeg','14786','62af45e8928f3835.jpg','data/files/store_2/goods_147/200908060925471585.jpg','1249550747','2','15');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('47','3','image/jpeg','14423','f16628f7bb81e7a3.jpg','data/files/store_2/goods_67/200908060927474675.jpg','1249550867','2','16');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('48','3','image/jpeg','17180','7c86857a689162fe.jpg','data/files/store_2/goods_121/200908060932011437.jpg','1249551121','2','17');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('49','3','image/jpeg','15260','ab69f24b4f3945e0.jpg','data/files/store_2/goods_84/200908060934444841.jpg','1249551284','2','17');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('50','3','image/jpeg','16859','e77d1081c91645a8.jpg','data/files/store_2/goods_195/200908060936352784.jpg','1249551395','2','18');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('51','3','image/jpeg','13430','7bc43095c465ebf0.jpg','data/files/store_2/goods_8/200908060936481674.jpg','1249551408','2','18');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('52','3','image/jpeg','14187','b6781ab419a5089a.jpg','data/files/store_2/goods_24/200908060937048695.jpg','1249551424','2','18');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('53','3','image/jpeg','12901','30f7b98ad565c2d0.jpg','data/files/store_2/goods_109/200908060938292631.jpg','1249551509','2','19');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('54','3','image/jpeg','12910','d55a5ba6fed7e162.jpg','data/files/store_2/goods_124/200908060938443027.jpg','1249551524','2','19');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('55','3','image/jpeg','16186','5e8e59bd6b611024.jpg','data/files/store_2/goods_142/200908060939026685.jpg','1249551542','2','19');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('56','3','image/jpeg','9265','f02b3f851f57f2ce.jpg','data/files/store_2/goods_143/200908060942233830.jpg','1249551743','2','20');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('57','3','image/jpeg','8483','d55955141b9a1f90.jpg','data/files/store_2/goods_156/200908060942363092.jpg','1249551756','2','20');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('58','3','image/jpeg','7043','be88bb9b556e2009.jpg','data/files/store_2/goods_166/200908060942462672.jpg','1249551766','2','20');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('59','3','image/jpeg','11456','1730d57edea6a55c.jpg','data/files/store_2/goods_25/200908060950258122.jpg','1249552225','2','21');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('60','3','image/jpeg','13215','e528ca3eb5748a3c.jpg','data/files/store_2/goods_39/200908060950399637.jpg','1249552239','2','21');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('61','3','image/jpeg','13113','76a7718b471d6d93.jpg','data/files/store_2/goods_55/200908060950555738.jpg','1249552255','2','21');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('62','3','image/jpeg','11796','2e1daf9d76edce5b.jpg','data/files/store_2/goods_67/200908060951072027.jpg','1249552267','2','21');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('63','3','image/jpeg','10290','b40cc60772351b06.jpg','data/files/store_2/goods_147/200908060952274906.jpg','1249552347','2','22');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('64','3','image/jpeg','11026','4bdd992c49d35190.jpg','data/files/store_2/goods_157/200908060952376888.jpg','1249552357','2','22');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('65','3','image/jpeg','16541','79ef35e6f2e347fa.jpg','data/files/store_2/goods_64/200908060954245662.jpg','1249552464','2','23');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('66','3','image/jpeg','16314','4eed1f55e152588a.jpg','data/files/store_2/goods_72/200908060954323544.jpg','1249552472','2','23');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('67','3','image/jpeg','23479','c9e640d5eb45e295.jpg','data/files/store_2/goods_86/200908060954465326.jpg','1249552486','2','23');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('68','3','image/jpeg','16676','5278b03233b52a17.jpg','data/files/store_2/goods_20/200908060957002218.jpg','1249552620','2','24');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('69','3','image/jpeg','12124','7b2d5ffeff2b1f0e.jpg','data/files/store_2/goods_139/200908060958592106.jpg','1249552739','2','25');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('70','3','image/jpeg','14064','73b603b1799e1457.jpg','data/files/store_2/goods_151/200908060959114414.jpg','1249552751','2','25');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('71','3','image/jpeg','14539','47f6ec2e8d9b2c82.jpg','data/files/store_2/goods_166/200908060959265796.jpg','1249552766','2','25');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('72','3','image/jpeg','10242','7905b61346259857.jpg','data/files/store_2/goods_47/200908061000474424.jpg','1249552847','2','26');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('73','3','image/jpeg','11232','ae4916f90e5227e9.jpg','data/files/store_2/goods_57/200908061000576924.jpg','1249552857','2','26');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('74','3','image/jpeg','12251','25e53455ff1b63a4.jpg','data/files/store_2/goods_71/200908061001114276.jpg','1249552871','2','26');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('75','3','image/jpeg','13586','d814a77dc9c54b7e.jpg','data/files/store_2/goods_86/200908061001263175.jpg','1249552886','2','26');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('76','3','image/jpeg','11068','6ae3ade81393e9ac.jpg','data/files/store_2/goods_5/200908061003253339.jpg','1249553005','2','27');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('77','3','image/jpeg','9507','688b8de7d9bc833a.jpg','data/files/store_2/goods_18/200908061003382600.jpg','1249553018','2','27');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('78','3','image/jpeg','12437','f7881551d7148623.jpg','data/files/store_2/goods_29/200908061003494534.jpg','1249553029','2','27');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('79','3','image/jpeg','12528','f15ea9ecafbdaf73.jpg','data/files/store_2/goods_115/200908061005154170.jpg','1249553115','2','28');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('80','3','image/jpeg','10964','fae2eea4ee2c75b6.jpg','data/files/store_2/goods_14/200908061006541461.jpg','1249553214','2','28');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('81','3','image/jpeg','12046','b75c0a159f3c10b5.jpg','data/files/store_2/goods_26/200908061007068653.jpg','1249553226','2','28');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('82','3','image/jpeg','13297','23141e259bb47c34.jpg','data/files/store_2/goods_121/200908061008412008.jpg','1249553321','2','29');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('83','3','image/jpeg','11197','946a7039481ebbd5.jpg','data/files/store_2/goods_127/200908061008473587.jpg','1249553327','2','29');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('84','3','image/jpeg','62289','103248455.jpg','data/files/store_3/goods_104/201405090745041424.jpg','1399621504','2','0');
INSERT INTO ecm_uploaded_file ( `file_id`, `store_id`, `file_type`, `file_size`, `file_name`, `file_path`, `add_time`, `belong`, `item_id` ) VALUES  ('89','3','image/jpeg','73702','a4tu1.jpg','data/files/store_3/goods_8/201405130616489502.jpg','1399961808','2','29');
DROP TABLE IF EXISTS ecm_user_coupon;
CREATE TABLE ecm_user_coupon (
  user_id int(10) unsigned NOT NULL,
  coupon_sn varchar(20) NOT NULL,
  PRIMARY KEY  (user_id,coupon_sn)
) TYPE=MyISAM;
DROP TABLE IF EXISTS ecm_user_priv;
CREATE TABLE ecm_user_priv (
  user_id int(10) unsigned NOT NULL default '0',
  store_id int(10) unsigned NOT NULL default '0',
  privs text NOT NULL,
  PRIMARY KEY  (user_id,store_id)
) TYPE=MyISAM;
INSERT INTO ecm_user_priv ( `user_id`, `store_id`, `privs` ) VALUES  ('1','0','all');
INSERT INTO ecm_user_priv ( `user_id`, `store_id`, `privs` ) VALUES  ('3','3','all');
INSERT INTO ecm_user_priv ( `user_id`, `store_id`, `privs` ) VALUES  ('2','0','default|all,default|all,setting|all,region|all,payment|all,theme|all,mailtemplate|all,template|all');
INSERT INTO ecm_user_priv ( `user_id`, `store_id`, `privs` ) VALUES  ('4','4','all');
-- END ECMall 2.0 SQL Dump Program 