/*
 * @Author: WangLiShuai
 * @Date: 2022-05-17 11:15:27
 * @LastEditTime: 2022-05-17 16:09:43
 * @FilePath: \hot-search\toutiao-trending-hout-search\utils.js
 * @Description: 
 */

import fs from 'fs'

export function mergeArticle(article, another) {
  const obj = {}
  for (const a of article.concat(another)) {
    obj[a.url] = a.title
  }
  return Object.entries(obj).map(([url, title]) => ({
    url,
    title
  }))
}

export function createReadMe(words) {
  const readme = fs.readFileSync('./README.md', 'utf-8')
  return readme.replace(/<!-- BEGIN -->[\W\w]*<!-- END -->/, createList(words))
}

export function createList(words) {
  return `<!-- BEGIN -->
  <!-- 最后更新时间 ${new Date()} -->
  // ${words.map((x, i) => `${i + 1}. [${x.Title}](${x.Url})`).join("\n")}
  ${words.map((x, i) => `${i + 1}. [${x.title}](https://sspai.com/post/${x.id})`)
      .join("\n")}
  <!-- END -->`
}


export function createArchive(words, date) {
  return `# ${date}\n
  共 ${words.length} 条\n
  ${createList(words)}`
}

