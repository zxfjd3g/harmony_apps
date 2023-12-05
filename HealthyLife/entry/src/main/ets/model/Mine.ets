/*
我的页面的数据信息模型
 */

export interface InfoItem {
  id: string;
  title: Resource;
  icon?: Resource;
}

export const MineInfoList: InfoItem[] = [
  {
    id: '1',
    title: $r('app.string.mine_personal_data')
  },
  {
    id: '2',
    title: $r('app.string.mine_check_updates')
  },
  {
    id: '3',
    title: $r('app.string.mine_about')
  }
];