/*
 Navicat Premium Data Transfer

 Source Server         : MongoDB_27017
 Source Server Type    : MongoDB
 Source Server Version : 50002
 Source Host           : localhost:27017
 Source Schema         : test

 Target Server Type    : MongoDB
 Target Server Version : 50002
 File Encoding         : 65001

 Date: 13/02/2022 13:34:56
*/


// ----------------------------
// Collection structure for blogs
// ----------------------------
db.getCollection("blogs").drop();
db.createCollection("blogs");

// ----------------------------
// Documents of blogs
// ----------------------------
db.getCollection("blogs").insert([ {
    _id: ObjectId("61416d501934000005007cc6"),
    year: "2021",
    month: "八月",
    date: "2021年9月23日",
    title: "python",
    text: "每次打开Jupyter Notebook时，在弹出的浏览器界面上是系统默认的文件位置（工作路径），有时候我们想保存写好的Python文件到自己想要的位置时就非常的不方便，那么我们该如何修改Jupyter Notebook默认的工作路径呢？\r\n\r\n1. 在cmd中输入命令使Jupyter产生配置文件：Jupyter_notebook_config.py\r\n\r\n   ```bash\r\n   jupyter notebook --generate-config\r\n   ```\r\n\r\n2. 用记事本打开此配置文档，并用搜索（Ctrl+F）找到如下字段：\r\n\r\n   ```python\r\n   #c.NotebookApp.notebook_dir =\r\n   ```\r\n\r\n   \r\n\r\n3. 在后面的引号“”中输入想修改为的默认工作路径，删除前面的#，保存文件 。",
    tags: "Python"
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("61416e2c1934000005007cc7"),
    year: "2021",
    month: "八月",
    date: "2021年9月14日",
    title: "java程序设计",
    text: "## Java排序方法\r\n\r\n#### 冒泡排序\r\n\r\n1. 相邻记录，反序则交换，if(a[j]>a[j+1])\r\n2. 冒泡排序每一趟都能把一个数送到最终位置【最大(向前向后），最小(从后向前)】\r\n3. 时间复杂度：平均o(n*n),最坏的情况：n-1+n-2+n-3....+1=n(n-1)/2，最好的情况：比较n-1次，交换0次o(n)\r\n4. 冒泡排序法受初始序列的影响\r\n5. 空间复杂度：o(1)\r\n6. 冒泡排序是稳定的【相同关键字在比较过程中不会发生前后位置交换】\r\n\r\n```java\r\nfor(i=1;i<n;i++){\r\n    for(j=0;j<n-i;j++)\r\n        if(a[j]>a[i]){\r\n            t=a[j];\r\n            a[j]=a[j+1];\r\n            a[j+1]=t;\r\n        }  \r\n}\r\n```\r\n\r\n\r\n\r\n#### 快速排序\r\n\r\n1. 枢轴：序列的第一个数当作枢轴先提出，i从前向后，j从后向前，都与枢轴比，j对应的数小于枢轴则提到i处，i对应的数大于枢轴则提到j处，i，j相遇则将枢轴值填入\r\n2. 每一次会把当前序列中的一个数送到最终位置【枢轴】\r\n3. 时间复杂度：o(log₂n)，原始有序时间复杂度最差：o(n² )\r\n4. 快速排序时间受初始序列影响（初始有序，反倒最差）\r\n5. 空间复杂度：o(log₂n)\r\n6. 稳定性：不稳定\r\n\r\n\r\n\r\n#### 选择排序\r\n\r\n1. 第i躺选当第i小的值，放到第i个位置【求最小值】\r\n\r\n2. 时间复杂度o(n²)\r\n\r\n3. 选择排序每一趟都能把一个值送到最终位置，从待排序序列中选择一个最小值放到已排序序列的末尾\r\n\r\n4. 选择排序时间不受初始序列影响，恒为o(n²)\r\n\r\n5. 空间复杂度：交换时用一个空间o(1)\r\n\r\n6. 选择排序不稳定\r\n\r\n   ```java\r\n   for(i=0;i<n-1;i++){\r\n       k=i;\r\n       for(j=i+1;j<n;j++){\r\n           if(a[j]<a[k])\r\n               k=j;\r\n           if(k!=i){\r\n               t=a[i];\r\n               a[i]=a[k];\r\n               a[k]=t;\r\n           }\r\n       }\r\n   }\r\n   ```\r\n\r\n   \r\n\r\n#### 插入排序\r\n\r\n   1. 直接插入排序\r\n\r\n      （1）基本思想：将一个待排序记录插入到一个有序子序列中依然保持有序。\r\n\r\n      （2）最后一次排序开始之前有可能所有的元素都不在最终位置上，也就是说插入排序并不保证每一趟都\t\t  把一个元素送到最终位置上\r\n      （3）插入排序最好的情况下：数据已经按要求有序，比较n-1次，不发生移动o(n)\r\n      \t\t  最坏的情况下：数据全部反序，需要比较n(n-1)/2，移动n(n-1)/2，o(n²)\r\n\r\n      （4）插入排序受数据初始序列的影响，数据基本有序的时候用插入排序最好。\r\n      （5）空间复杂度：o(1)\r\n      （6）稳定性：稳定\r\n\r\n      \r\n\r\n#### 希尔排序\r\n\r\n1. 分组插入排序，逐渐合并分组后再插入排序\r\n2. 稳定性：不稳定\r\n\r\n\r\n\r\n#### 归并排序\r\n\r\n1. 两个有序子序列合并成一个有序子序列\r\n2. 归并排序每一趟都要进行n次赋值，进行log₂n躺，所以时间复杂度恒o(log₂n)\r\n3. 最后一次排序开始之前有可能所有的元素都不在最终位置上，也就是说归并排序并不保证每一趟都把一个元素送到最终位置\r\n4. 空间复杂度：o(n)\r\n5. 稳定性：稳定\r\n\r\n\r\n\r\n#### 堆排序【选择类排序】\r\n\r\n1. 基本思想：树形选择排序的一个变形，使用一种堆的概念\r\n\r\n2. 大根堆【从小到大排序】任意一个非叶子结点的值都大于其左右孩子的值，\r\n\r\n   小根堆【从大到小排序】任意一个非叶子结点的值都小于其左右孩子的值，\r\n\r\n3. 时间复杂度：初始建堆+n-2次调整堆时间，恒为o(log₂n)\r\n\r\n4. 空间复杂度：o(1)交换用的一个空间\r\n\r\n5. 每趟都会把一个元素送到最终位置\r\n\r\n6. 不受初始序列的影响\r\n\r\n7. 不稳定\r\n\r\n\r\n\r\n#### 基数排序【桶】\r\n\r\n1. 基本思想：按数值的各位进行桶的分配，之后收集成一组，再按十位分配桶，再收集，再按百位分配收集，依次进行\r\n2. 位数为d，基数(桶数)\r\n\r\n\r\n\r\n#### 总结：\r\n\r\n不稳定排序：快速排序，选择排序，堆排序，希尔排序\r\n\r\n稳定排序：冒泡排序，直接插入排序，归并排序，基数排序\r\n\r\n时间复杂度受初始序列影响：快速排序，希尔排序，直接插入排序，冒泡排序\r\n\r\n每次排序都能使一个元素到达最终位置：快速排序，选择排序(最小)，堆排序(最大)，冒泡排序(大泡沉底)\r\n\r\n平均性能最好的是：快速排序\r\n\r\n空间复杂度最大的是：归并排序\r\n\r\n基本有序时选：插入排序\r\n\r\n数据有序反而更差的是：快速排序\r\n\r\n \r\n\r\n\r\n\r\n\r\n\r\n",
    tags: "Java"
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("61416e5a1934000005007cc8"),
    year: "2021",
    month: "八月",
    date: "2021年9月14日",
    title: "Linux基础知识",
    text: "# 一级标题\n### 三级标题\n==hahaha==\n`code`",
    tags: "Linux"
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("61416e7e1934000005007cc9"),
    year: "2021",
    month: "八月",
    date: "2021年9月14日",
    title: "C语言基础",
    text: "# 一级标题\n### 三级标题\n==hahaha==\n`code`",
    tags: "C"
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("614171dc1934000005007cca"),
    year: "2021",
    month: "八月",
    date: "2021年9月14日",
    title: "hadoop搭建",
    text: "### 修改主机名\r\n\r\n```bash\r\n[hadoop@master ~]$ hostnamectl set-hostname master\r\n[hadoop@master ~]$ bash\r\n```\r\n\r\n\r\n\r\n### 添加删除用户\r\n\r\n```bash\r\n[hadoop@master ~]$ useradd hadoop\r\n[hadoop@master ~]$ passwd  hadoop\r\n[hadoop@master ~]$ userdel hadoop\r\n```\r\n\r\n\r\n\r\n### hdfs操作\r\n\r\n```bash\r\nhdfs dfs -rm -r /test\t# 删除目录\r\nhdfs dfs -rm -f /test/*\t\t# 删除文件\r\n```\r\n\r\n\r\n\r\n### vi下的复制粘贴\r\n\r\n在插入模式下按==Esc==退出，之后按==v==通过上下键选择要复制的内容，按==y==进行复制，按==p==进行粘贴\r\n\r\n\r\n\r\n\r\n\r\n###  重启网络服务\r\n\r\n centos6的网卡重启方法：service network restart\r\n centos7的网卡重启方法：systemctl restart network \r\n\r\n\r\n\r\n\r\n\r\n### 关闭防火墙\r\n\r\n查看防火墙状态： systemctl status firewalld.service\r\n\r\n关闭防火墙： systemctl stop firewalld.service\r\n\r\n禁用防火墙开机自启： systemctl disable firewalld.service",
    tags: "hadoop"
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("6152904982b05f53e96d9272"),
    year: "2021",
    month: "八月",
    date: "2021年9月28日",
    title: "router-link进行跳转",
    text: "写业务中，从一个页面跳转到另一个页面，经常需要传值和取值，如何实现？\n\n## 1、通过router-link进行跳转\n\n1. 使用`query`传递参数，路由必须使用path引入\n\n   ```vue\n   <-- 在a页面进行传值 -->\n       \n   <router-link :to=\"{path: '/home', query: {key: 'hello', value: 'world'}}\">\n   　　<button>跳转</button>\n   </router-link>       \n   ```\n\n   跳转地址 => /home?key=hello&value=world\n\n   在b页面取值： **this.$route.query.key**\n\n   \n\n2. 使用`params`传递参数，路由必须使用name引入\n\n   ```vue\n   <-- 在a页面进行传值 -->\n       \n   <router-link :to=\"{name: '/home', params: {key: 'hello', value: 'world'}}\">\n   　　<button>跳转</button>\n   </router-link>　　\n   ```\n\n   跳转地址 ==> /home\n\n   在b页面取值：**this.$route.params.key**\n\n\n\n## 2、$router方式跳转\n\n1. 通过query\n\n   ```vue\n   this.$router.push({\n   　　path: '/detail',\n   　　query: {\n   　　　　name: 'admin',\n   　　　　code: 10021\n   　　}\n   });\n   ```\n\n   跳转地址 => /detail?name=admin&code=10021\n\n   取值：**this.$route.query.name**\n\n\n\n## 3、vue页面中的内部跳转\n\n如果是vue页面中的内部跳转，可以用this.$router.push()实现，但是如果用这种方法跳到外部链接，就会报错，我们一看链接的路径，原来是我们的外部链接前面加上了http://localhost:8080/#/这一串导致跳转出现问题，那么我们如何跳转到外部链接呢，我们只需用 window.location.href = ‘url’来实现，具体代码如下：\n\n```\n <span @click=\"See(url)\">点击转跳</span>\n```\n\n\n\n上面是触发一个点击事件，其中item.qj_url是传给see的url链接，下面是事件执行的函数\n\n```\n See(e) { \n \t\twindow.location.href = e   \n    }\n```\n\nok，到此就结束啦",
    tags: [
        "Vue"
    ],
    __v: NumberInt("0")
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("6174f9cecd578943ed81cfc7"),
    year: "2021",
    month: "九月",
    date: "2021年10月24日",
    title: "1212",
    text: "1212",
    tags: [
        "Other"
    ],
    __v: NumberInt("0")
} ]);
db.getCollection("blogs").insert([ {
    _id: ObjectId("6174fa90cd578943ed81cfd5"),
    year: "2021",
    month: "九月",
    date: "2021年10月24日",
    title: "1331",
    text: "qweqweqwe",
    tags: [
        "Other"
    ],
    __v: NumberInt("0")
} ]);

// ----------------------------
// Collection structure for quotes
// ----------------------------
db.getCollection("quotes").drop();
db.createCollection("quotes");

// ----------------------------
// Documents of quotes
// ----------------------------
db.getCollection("quotes").insert([ {
    _id: ObjectId("618924027f44d88695bd7098"),
    text: "“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”",
    author: "Albert Einstein",
    tags: [
        "change",
        "deep-thoughts",
        "thinking",
        "world"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("618924027f44d88695bd7099"),
    text: "“It is our choices, Harry, that show what we truly are, far more than our abilities.”",
    author: "J.K. Rowling",
    tags: [
        "abilities",
        "choices"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("618924027f44d88695bd709a"),
    text: "“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”",
    author: "Albert Einstein",
    tags: [
        "inspirational",
        "life",
        "live",
        "miracle",
        "miracles"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("618924027f44d88695bd709b"),
    text: "“The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.”",
    author: "Jane Austen",
    tags: [
        "aliteracy",
        "books",
        "classic",
        "humor"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e2"),
    text: "“The world as we have created it is a process of our thinking. It cannot be changed without changing our thinking.”",
    tags: [
        "change",
        "deep-thoughts",
        "thinking",
        "world"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e3"),
    text: "“It is our choices, Harry, that show what we truly are, far more than our abilities.”",
    tags: [
        "abilities",
        "choices"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e4"),
    text: "“There are only two ways to live your life. One is as though nothing is a miracle. The other is as though everything is a miracle.”",
    tags: [
        "inspirational",
        "life",
        "live",
        "miracle",
        "miracles"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e5"),
    text: "“The person, be it gentleman or lady, who has not pleasure in a good novel, must be intolerably stupid.”",
    tags: [
        "aliteracy",
        "books",
        "classic",
        "humor"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e6"),
    text: "“Imperfection is beauty, madness is genius and it's better to be absolutely ridiculous than absolutely boring.”",
    tags: [
        "be-yourself",
        "inspirational"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e7"),
    text: "“Try not to become a man of success. Rather become a man of value.”",
    tags: [
        "adulthood",
        "success",
        "value"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e8"),
    text: "“It is better to be hated for what you are than to be loved for what you are not.”",
    tags: [
        "life",
        "love"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9e9"),
    text: "“I have not failed. I've just found 10,000 ways that won't work.”",
    tags: [
        "edison",
        "failure",
        "inspirational",
        "paraphrased"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9ea"),
    text: "“A woman is like a tea bag; you never know how strong it is until it's in hot water.”",
    tags: [
        "misattributed-eleanor-roosevelt"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79d18201d1f66e5d9eb"),
    text: "“A day without sunshine is like, you know, night.”",
    tags: [
        "humor",
        "obvious",
        "simile"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9ec"),
    text: "“This life is what you make it. No matter what, you're going to mess up sometimes, it's a universal truth. But the good part is you get to decide how you're going to mess it up. Girls will be your friends - they'll act like it anyway. But just remember, some come, some go. The ones that stay with you through everything - they're your true best friends. Don't let go of them. Also remember, sisters make the best friends in the world. As for lovers, well, they'll come and go too. And baby, I hate to say it, most of them - actually pretty much all of them are going to break your heart, but you can't give up because if you give up, you'll never find your soulmate. You'll never find that half who makes you whole and that goes for everything. Just because you fail once, doesn't mean you're gonna fail at everything. Keep trying, hold on, and always, always, always believe in yourself, because if you don't, then who will, sweetie? So keep your head high, keep your chin up, and most importantly, keep smiling, because life's a beautiful thing and there's so much to smile about.”",
    tags: [
        "friends",
        "heartbreak",
        "inspirational",
        "life",
        "love",
        "sisters"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9ed"),
    text: "“It takes a great deal of bravery to stand up to our enemies, but just as much to stand up to our friends.”",
    tags: [
        "courage",
        "friends"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9ee"),
    text: "“If you can't explain it to a six year old, you don't understand it yourself.”",
    tags: [
        "simplicity",
        "understand"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9ef"),
    text: "“You may not be her first, her last, or her only. She loved before she may love again. But if she loves you now, what else matters? She's not perfect—you aren't either, and the two of you may never be perfect together but if she can make you laugh, cause you to think twice, and admit to being human and making mistakes, hold onto her and give her the most you can. She may not be thinking about you every second of the day, but she will give you a part of her that she knows you can break—her heart. So don't hurt her, don't change her, don't analyze and don't expect more than she can give. Smile when she makes you happy, let her know when she makes you mad, and miss her when she's not there.”",
    tags: [
        "love"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9f0"),
    text: "“I like nonsense, it wakes up the brain cells. Fantasy is a necessary ingredient in living.”",
    tags: [
        "fantasy"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9f1"),
    text: "“I may not have gone where I intended to go, but I think I have ended up where I needed to be.”",
    tags: [
        "life",
        "navigation"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9f2"),
    text: "“The opposite of love is not hate, it's indifference. The opposite of art is not ugliness, it's indifference. The opposite of faith is not heresy, it's indifference. And the opposite of life is not death, it's indifference.”",
    tags: [
        "activism",
        "apathy",
        "hate",
        "indifference",
        "inspirational",
        "love",
        "opposite",
        "philosophy"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9f3"),
    text: "“It is not a lack of love, but a lack of friendship that makes unhappy marriages.”",
    tags: [
        "friendship",
        "lack-of-friendship",
        "lack-of-love",
        "love",
        "marriage",
        "unhappy-marriage"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9f4"),
    text: "“Good friends, good books, and a sleepy conscience: this is the ideal life.”",
    tags: [
        "books",
        "contentment",
        "friends",
        "friendship",
        "life"
    ]
} ]);
db.getCollection("quotes").insert([ {
    _id: ObjectId("6189d79e18201d1f66e5d9f5"),
    text: "“Life is what happens to us while we are making other plans.”",
    tags: [
        "fate",
        "life",
        "misattributed-john-lennon",
        "planning",
        "plans"
    ]
} ]);

// ----------------------------
// Collection structure for tags
// ----------------------------
db.getCollection("tags").drop();
db.createCollection("tags");

// ----------------------------
// Documents of tags
// ----------------------------
db.getCollection("tags").insert([ {
    _id: ObjectId("6140a103f3807b491a6483c1"),
    tag: "C",
    __v: NumberInt("0")
} ]);
db.getCollection("tags").insert([ {
    _id: ObjectId("6140ad03406e4bf3229c76d1"),
    tag: "Python",
    __v: NumberInt("0")
} ]);
db.getCollection("tags").insert([ {
    _id: ObjectId("61415fa71934000005007cc2"),
    tag: "Java"
} ]);
db.getCollection("tags").insert([ {
    _id: ObjectId("61415fab1934000005007cc3"),
    tag: "Linux"
} ]);
db.getCollection("tags").insert([ {
    _id: ObjectId("61529e827f2a000032003742"),
    tag: "Vue"
} ]);
db.getCollection("tags").insert([ {
    _id: ObjectId("6152c0107f740000db0055a2"),
    tag: "Hadoop"
} ]);
db.getCollection("tags").insert([ {
    _id: ObjectId("6152c0177f740000db0055a3"),
    tag: "Other"
} ]);
