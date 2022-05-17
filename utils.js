/*
 * @Author: WangLiShuai
 * @Date: 2022-05-17 11:15:27
 * @LastEditTime: 2022-05-17 15:38:48
 * @FilePath: \hot-search\toutiao-trending-hout-search\utils.js
 * @Description: 
 */

import fs from 'fs'

function mergeArticle(article, another) {
  const obj = {}
  for (const a of article.concat(another)) {
    obj[a.url] = a.title
  }
  return Object.entries(obj).map(([url, title]) => ({
    url,
    title
  }))
}

function createReadMe(words) {
  const readme = fs.readFileSync('./README.md', 'utf-8')
  return readme.replace(/<!-- BEGIN -->[\W\w]*<!-- END -->/, createList(words))
}

function createList(words) {
  return `<!-- BEGIN -->
  <!-- 最后更新时间 ${new Date()} -->
  ${words.map((x, i) => `${i + 1}. [${x.Title}](${x.Url})`).join("\n")}
  <!-- END -->`
}


function createArchive(words, date) {
  return `# ${date}\n
  共 ${words.length} 条\n
  ${createList(words)}`
}

module.exports = {
  mergeArticle,
  createReadMe,
  createList,
  createArchive
}
