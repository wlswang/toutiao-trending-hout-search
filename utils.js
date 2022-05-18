/*
 * @Author: WangLiShuai
 * @Date: 2022-05-17 11:15:27
 * @LastEditTime: 2022-05-18 13:23:12
 * @FilePath: \hot-search\toutiao-trending-hout-search\utils.js
 * @Description: 
 */

const fs = require('fs');


function mergeArticle(article, another) {
  const obj = {}
  for (const a of article.concat(another)) {
    obj[a.Url] = a.Title
  }
  return Object.entries(obj).map(([Url, Title]) => ({
    Url,
    Title
  }))
}

function createReadMe(words) {
  const readme = fs.readFileSync('./README.md', 'utf-8')
  return readme.replace(/<!-- BEGIN -->[\W\w]*<!-- END -->/, createList(words))
}
// ${words.map((x, i) => `${i + 1}. [${x.Title}](${x.Url})`).join("\n")}

function createList(words) {
  return `<!-- BEGIN -->
  <!-- 最后更新时间 ${new Date()} -->
  ${words.map((x, i) => `${i + 1}. [${x.Title}](${x.Url})`)
      .join("\n")}
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
