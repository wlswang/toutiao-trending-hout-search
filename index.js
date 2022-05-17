/*
 *                        _oo0oo_
 *                       o8888888o
 *                       88" . "88
 *                       (| -_- |)
 *                       0\  =  /0
 *                     ___/`---'\___
 *                   .' \\|     |// '.
 *                  / \\|||  :  |||// \
 *                 / _||||| -:- |||||- \
 *                |   | \\\  - /// |   |
 *                | \_|  ''\---/''  |_/ |
 *                \  .-\__  '-'  ___/-. /
 *              ___'. .'  /--.--\  `. .'___
 *           ."" '<  `.___\_<|>_/___.' >' "".
 *          | | :  `- \`.;`\ _ /`;.`/ - ` : | |
 *          \  \ `_.   \_ __\ /__ _/   .-` /  /
 *      =====`-.____`.___ \_____/___.-`___.-'=====
 *                        `=---='
 * 
 * 
 *      ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
 * 
 *            佛祖保佑     永不宕机     永无BUG
 * 
 *        佛曰:  
 *                写字楼里写字间，写字间里程序员；  
 *                程序人员写程序，又拿程序换酒钱。  
 *                酒醒只在网上坐，酒醉还来网下眠；  
 *                酒醉酒醒日复日，网上网下年复年。  
 *                但愿老死电脑间，不愿鞠躬老板前；  
 *                奔驰宝马贵者趣，公交自行程序员。  
 *                别人笑我忒疯癫，我笑自己命太贱；  
 *                不见满街漂亮妹，哪个归得程序员？
 */

/*
 * @Author: WangLiShuai
 * @Date: 2022-05-17 11:19:19
 * @LastEditTime: 2022-05-17 11:43:31
 * @FilePath: \hot-search\toutiao-trending-hout-search\index.js
 * @Description: 
 */
import { createRequire } from 'module';
const require = createRequire(import.meta.url);
const axios = require('axios')
const dayjs = require('dayjs');
const path = require("path");
const fs = require('fs');
// const { createReadMe, createArchive } = require("./utils");
import { createReadMe, createArchive } from './utils.js'
// import { mergeArticle, createReadMe, createArchive, createArchive } from './utils.js'

(async () => {
  try {
    // const result = await axios.get("https://www.toutiao.com/hot-event/hot-board/?origin=toutiao_pc&_signature=_02B4Z6wo00101qJwsjQAAIDCInJIdhIJ33aiVLaAAMorht4jcNHUlPjY9LVGJ6NZF12tjXc5KdklK-RZ0m.XvJj-r4WrujlHCYZCxLJY5BeqnHTdFmr11sl065.qqNV2Jz6AYBkJdZJx1xBgVkb1")
    const result = await axios.get("https://sspai.com/api/v1/article/tag/page/get?limit=10&offset=0&created_at=1641703407&tag=%E7%83%AD%E9%97%A8%E6%96%87%E7%AB%A0&released=false")
    console.log('result', result);
    const data = result.data.data

    const yyyyMMdd = dayjs().format('YYYY-MM-DD')
    const fullPath = path.join('raw', `${yyyyMMdd}.json`)

    // 保存原始数据
    // const queswordsAll = mergeArticle()
    fs.writeFileSync(fullPath, JSON.stringify(data))

    // 更新 README.md
    const readme = createReadMe(data)
    fs.writeFileSync('./README.md', readme)

    // 更新 archives
    const archiveText = createArchive(data, yyyyMMdd)
    const archivePath = path.join('archives', `${yyyyMMdd}.md`)
    fs.writeFileSync(archivePath, archiveText)

  } catch (e) {
    console.log(e);
  }

})();

