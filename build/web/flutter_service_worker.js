'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "a7a4fdd0d4248dd4fa7bcbd936015d5e",
"assets/AssetManifest.json": "68e937e9407743962177b8c25173df0d",
"assets/flags/country.json": "a5a9fedee9889586d8d5d3a540c41c6f",
"assets/flags/flags/1x1/ac.svg": "42139f7cc8f09d90c8e43c4cca1923a7",
"assets/flags/flags/1x1/ad.svg": "91f170502a09d0666eec123ca81fe778",
"assets/flags/flags/1x1/ae.svg": "b62c8ca639b1bdb3bafc60d1d26d54da",
"assets/flags/flags/1x1/af.svg": "fb21258463e01be05ae8badafb006b82",
"assets/flags/flags/1x1/ag.svg": "b34b372d5c74c78ea404a8f13b29bcc6",
"assets/flags/flags/1x1/ai.svg": "68783b8780359c6495459aaeb6fa1775",
"assets/flags/flags/1x1/al.svg": "c5821b272f37155c82805313f437bd0e",
"assets/flags/flags/1x1/am.svg": "8a063b9e5908a3f0dd57b5aa4deeb852",
"assets/flags/flags/1x1/ao.svg": "11f61ca564da05361edd3dc9b4b6dfa6",
"assets/flags/flags/1x1/aq.svg": "6f1f242caf2cdd5c64cc9577d78e7de9",
"assets/flags/flags/1x1/ar.svg": "91bcbddc213ef4aac71bb84fccc807f3",
"assets/flags/flags/1x1/arab.svg": "cbe640193523412067c22b1b762d589c",
"assets/flags/flags/1x1/as.svg": "511c3417948547a36a68875df0585995",
"assets/flags/flags/1x1/at.svg": "27ec5a7f28c5d0c8f02181d2ab888958",
"assets/flags/flags/1x1/au.svg": "f3c973867c6c71ea1429e1c7bcab6fd6",
"assets/flags/flags/1x1/aw.svg": "513ef5fdfbdecaede63ab62d56d6c1e6",
"assets/flags/flags/1x1/ax.svg": "1345aec8c48606e5b48283705894cc0e",
"assets/flags/flags/1x1/az.svg": "ee61daa1fd7aee4386a54db3b709160c",
"assets/flags/flags/1x1/ba.svg": "8d9a86c2b832fc125cc1f65088773b74",
"assets/flags/flags/1x1/bb.svg": "710da1e91997299d6dc32b5779baa464",
"assets/flags/flags/1x1/bd.svg": "9a6cf43247bf4c3024eabccb5c3e6e30",
"assets/flags/flags/1x1/be.svg": "6fc013c9d1007c352313f021a700bb66",
"assets/flags/flags/1x1/bf.svg": "7194e2401226188f053b48d5d41ba00d",
"assets/flags/flags/1x1/bg.svg": "47c70d31371646e7e1823e56d769c283",
"assets/flags/flags/1x1/bh.svg": "ee0ac09528486a658d0d2ec5c6d90ba1",
"assets/flags/flags/1x1/bi.svg": "2d210422486eded7740b7093570dc9b0",
"assets/flags/flags/1x1/bj.svg": "ea7e4090370e82b6a1ef029245e90bf3",
"assets/flags/flags/1x1/bl.svg": "8028dd1166b77764314e7494f6818469",
"assets/flags/flags/1x1/bm.svg": "de57a03e3fed9afdde8bbbecf6d27588",
"assets/flags/flags/1x1/bn.svg": "4c6a2563181e51f8dd48b073c6ae47b7",
"assets/flags/flags/1x1/bo.svg": "b5bc1428b5796bdd9acafda2907c89f1",
"assets/flags/flags/1x1/bq.svg": "a217e580785f179ca8c65e849cc7fce6",
"assets/flags/flags/1x1/br.svg": "8bcede6133e8c04278c5ba83caa509f6",
"assets/flags/flags/1x1/bs.svg": "76c019833e07208e66384ca80b89417f",
"assets/flags/flags/1x1/bt.svg": "552a870b8d0ff0782265b123c624e830",
"assets/flags/flags/1x1/bv.svg": "83e56e13ab80efe1e90c20d5584b007a",
"assets/flags/flags/1x1/bw.svg": "fee2051bfe7a4082ee62282641d7e27d",
"assets/flags/flags/1x1/by.svg": "12097dbd339258ef11bc23b1568c6d6f",
"assets/flags/flags/1x1/bz.svg": "8edb6c0bb1afe6b2df7f115a7b198f01",
"assets/flags/flags/1x1/ca.svg": "4f67be07db374b31b5fea5902e540895",
"assets/flags/flags/1x1/cc.svg": "a3c2a86c43265fcd27dd6d168bd51c65",
"assets/flags/flags/1x1/cd.svg": "e0101fc8a6d1187fdc578a13b1f1cbc7",
"assets/flags/flags/1x1/cefta.svg": "44e3c803d7b693d0ffafccac688acbe4",
"assets/flags/flags/1x1/cf.svg": "cbd95957781f73a837a6333aa980a253",
"assets/flags/flags/1x1/cg.svg": "c0adcefa0a15968c289b6b8caf62bcba",
"assets/flags/flags/1x1/ch.svg": "9f295dfce66ba565655e91d247284005",
"assets/flags/flags/1x1/ci.svg": "4914b40504850ce7fa40aa544f981d3e",
"assets/flags/flags/1x1/ck.svg": "99108f218aba644d1f6d0d50c3380fa6",
"assets/flags/flags/1x1/cl.svg": "53ca595c90a802097d1fb10c91cf0c7b",
"assets/flags/flags/1x1/cm.svg": "a0098093d2e88e6e479fff311ee68b65",
"assets/flags/flags/1x1/cn.svg": "355e2356f225e3b99b73b05c23f11ec9",
"assets/flags/flags/1x1/co.svg": "2d27993064a890abf252036cf65d3319",
"assets/flags/flags/1x1/cp.svg": "5dbee55574f591055ac79e46d78864ef",
"assets/flags/flags/1x1/cr.svg": "a7d3b3129756d3ff6d8d9e0e5fc07c7c",
"assets/flags/flags/1x1/cu.svg": "9d151a20cf6c12d5efb78e60364c8ebe",
"assets/flags/flags/1x1/cv.svg": "825501fd112391d6910c47b364ecfd71",
"assets/flags/flags/1x1/cw.svg": "57c4b0522bd8d3f9ad63161b0de33e71",
"assets/flags/flags/1x1/cx.svg": "766e1e5b84a2265164870e61b8e9361d",
"assets/flags/flags/1x1/cy.svg": "ff138932c9728d3f669a0e60d1b972d5",
"assets/flags/flags/1x1/cz.svg": "8ffb243fd5351444af894f75415fbf16",
"assets/flags/flags/1x1/de.svg": "4e64ea42c3d10fdaba69ac91b1dcc8ff",
"assets/flags/flags/1x1/dg.svg": "c35d4a1668d2ae3b1a4f364d14724026",
"assets/flags/flags/1x1/dj.svg": "1b0a107021019235432e8dc367eb46f6",
"assets/flags/flags/1x1/dk.svg": "079b834714bed8a2a943d5985cd8140c",
"assets/flags/flags/1x1/dm.svg": "4cb659a70c4b0bd8a521303e06f0a28e",
"assets/flags/flags/1x1/do.svg": "89fb4875fa5b0499fc65e8c7b63aeaf2",
"assets/flags/flags/1x1/dz.svg": "e8688062e43dbd51e6458acefd84d15f",
"assets/flags/flags/1x1/eac.svg": "6533667b5060b2b54d1bc8e0bf9bcd9e",
"assets/flags/flags/1x1/ec.svg": "89c7836755e3cafbec06fab5d4695631",
"assets/flags/flags/1x1/ee.svg": "8966b41611a113d92c0933fc9a84ee4c",
"assets/flags/flags/1x1/eg.svg": "16c8e9ca930a7ec97269d485ec53fe07",
"assets/flags/flags/1x1/eh.svg": "bd82f0480ceb87a2aebc997f1f93f742",
"assets/flags/flags/1x1/er.svg": "7b2d3410782e869e40f84022b5b711a2",
"assets/flags/flags/1x1/es-ct.svg": "e5d7fd1b2ee438320338f0866cfef135",
"assets/flags/flags/1x1/es-ga.svg": "5e8c5dcce1abc330b5c000b5de8d8b00",
"assets/flags/flags/1x1/es-pv.svg": "1120622840e665a7382eb22b4986749b",
"assets/flags/flags/1x1/es.svg": "ebd9bcf21fb645e3f1ad336fdc4b9f88",
"assets/flags/flags/1x1/et.svg": "26d0337e1a446430218173bbcf92373a",
"assets/flags/flags/1x1/eu.svg": "ac4883d3c8e71ff1589cbdb5b4d2eef1",
"assets/flags/flags/1x1/fi.svg": "5b3833a61c8740336765c46c89c2a6f6",
"assets/flags/flags/1x1/fj.svg": "017e64ee8605bd5e12e9d5be7e0641e9",
"assets/flags/flags/1x1/fk.svg": "d44fca660510f0674850c9c7576f462b",
"assets/flags/flags/1x1/fm.svg": "d3becf4c6f7a9aa0976c6cc26ce83015",
"assets/flags/flags/1x1/fo.svg": "fcae5b2a423c94ba75e93dab51d61e10",
"assets/flags/flags/1x1/fr.svg": "53ca53f99d8f63d43f4e785b2fee0032",
"assets/flags/flags/1x1/ga.svg": "1aa26b2be2f1faf8c75476e95f09c453",
"assets/flags/flags/1x1/gb-eng.svg": "a877951862ba77ad974775646c0b22be",
"assets/flags/flags/1x1/gb-nir.svg": "e2436a22b2d6e64580e550ff97be43a5",
"assets/flags/flags/1x1/gb-sct.svg": "9506ab939d483c630b7db236ce744665",
"assets/flags/flags/1x1/gb-wls.svg": "c488ecae68ddf5574c36b7e5782f6954",
"assets/flags/flags/1x1/gb.svg": "521ff9175692d87884eb69d15280dba1",
"assets/flags/flags/1x1/gd.svg": "3b819eed84429e82ccbaad4bfd3a75d2",
"assets/flags/flags/1x1/ge.svg": "e46de93c3deb6bfc4b94e9ecbc551d82",
"assets/flags/flags/1x1/gf.svg": "ad260ed81dc320b7fdcfa5534d7ae688",
"assets/flags/flags/1x1/gg.svg": "a86fc4c7fa8135c008645d2d6a4e5335",
"assets/flags/flags/1x1/gh.svg": "9e338876783991ac58ef3d234d3d0ce9",
"assets/flags/flags/1x1/gi.svg": "22f8b28bd96189041d73ad7bcaacbc7c",
"assets/flags/flags/1x1/gl.svg": "05073911834f849510d126c39b5e7e34",
"assets/flags/flags/1x1/gm.svg": "301e054b9f8d6489cdbfa02c14fdd11b",
"assets/flags/flags/1x1/gn.svg": "b95b7a545b0fc81827a37a219024900b",
"assets/flags/flags/1x1/gp.svg": "d96954ad3e29316ecda12a47eda081bd",
"assets/flags/flags/1x1/gq.svg": "e3876a883db8f2847459cc904e44f44c",
"assets/flags/flags/1x1/gr.svg": "398239dd784ae5d4687d84ccbd54160e",
"assets/flags/flags/1x1/gs.svg": "10db4ed146e73babbca09232d89d8dab",
"assets/flags/flags/1x1/gt.svg": "c273e63d59258ce5e7acd7bf8771fc6c",
"assets/flags/flags/1x1/gu.svg": "928839cbe247335126fccbcd2815230a",
"assets/flags/flags/1x1/gw.svg": "f609ea1f20fcf4f74ca64a5348267889",
"assets/flags/flags/1x1/gy.svg": "c908281a23558922ef9d44ce49240372",
"assets/flags/flags/1x1/hk.svg": "b50f686311ac669023a17ba3fe3649b6",
"assets/flags/flags/1x1/hm.svg": "3ac8ee676728e7138b7fef72c8a0ca86",
"assets/flags/flags/1x1/hn.svg": "1bf6f6ac3aa17689956deeaf8d7a6c0e",
"assets/flags/flags/1x1/hr.svg": "8c153062b3b8b42c5df290a42ec52cc8",
"assets/flags/flags/1x1/ht.svg": "f6f88a908ecbb3095cc583e579b4aed4",
"assets/flags/flags/1x1/hu.svg": "ac606833cdcf0da0803709ac75c75036",
"assets/flags/flags/1x1/ic.svg": "dc0d5bfce4986880c5066d29c0f83a2f",
"assets/flags/flags/1x1/id.svg": "b966e5565c7ca5538622eafdcc091c45",
"assets/flags/flags/1x1/ie.svg": "110efbf8a9a95ec3384b8b45dc5bc607",
"assets/flags/flags/1x1/il.svg": "5d16f0024e7d8afbe18ea4bf5615cfd9",
"assets/flags/flags/1x1/im.svg": "de2c825c16b63a16a1683c66e481a1cc",
"assets/flags/flags/1x1/in.svg": "88a58878ea8225e0376adfca79b95cde",
"assets/flags/flags/1x1/io.svg": "ebf12e765c2013de9721f999092e000d",
"assets/flags/flags/1x1/iq.svg": "fb484ddc9d7e580b181b0fbe061dad28",
"assets/flags/flags/1x1/ir.svg": "de1df850c8e6adddf68d030e8a6d3b20",
"assets/flags/flags/1x1/is.svg": "cc33fe268eddcfc8238ff2b9925b6f4c",
"assets/flags/flags/1x1/it.svg": "5dd499d625a2415aef316563427b867a",
"assets/flags/flags/1x1/je.svg": "8b8d05a767fbd7fee8e23f652451515d",
"assets/flags/flags/1x1/jm.svg": "a5de6786f06f1deaa135accb7b661175",
"assets/flags/flags/1x1/jo.svg": "fec997000e481e4e6f3e36b92a62a780",
"assets/flags/flags/1x1/jp.svg": "a115dec6d61e188df964fe7326061232",
"assets/flags/flags/1x1/ke.svg": "6b90273e5bafc0cb61fecd0f635bb261",
"assets/flags/flags/1x1/kg.svg": "18de4fe18e360035ae6df2ce97093e64",
"assets/flags/flags/1x1/kh.svg": "dfd846c2a398cd749ca62d3a4c7a3b42",
"assets/flags/flags/1x1/ki.svg": "a02a4304f9934d4d90ecfc55141d0428",
"assets/flags/flags/1x1/km.svg": "86e906fceba0505825764c52d90e3d31",
"assets/flags/flags/1x1/kn.svg": "59d2782456a7cdaa7b1d5fba39ec3161",
"assets/flags/flags/1x1/kp.svg": "35e33aa7768845bf0e240c3f98e6c4a1",
"assets/flags/flags/1x1/kr.svg": "ea9dade82beaf4605cafef89b2715ecc",
"assets/flags/flags/1x1/kw.svg": "c244f6de0c8a07185fe48fef81c18457",
"assets/flags/flags/1x1/ky.svg": "38b284e5e99373ed752db505899082f8",
"assets/flags/flags/1x1/kz.svg": "1b1888b40e9d60cec2608c58381204cd",
"assets/flags/flags/1x1/la.svg": "e0ec1b4e820fd8e73b09b83eb29d5de4",
"assets/flags/flags/1x1/lb.svg": "528d7e0a628ded96c41d3d97dedd1741",
"assets/flags/flags/1x1/lc.svg": "25f4a7464ca9fe11f839731563b84b07",
"assets/flags/flags/1x1/li.svg": "f16e9dfbf7d629c7c4469400280a395b",
"assets/flags/flags/1x1/lk.svg": "ed0edbaa4f42884bfc7a664649dd1e5b",
"assets/flags/flags/1x1/lr.svg": "0cfda4d7188f3b8fd50c7b294f35b561",
"assets/flags/flags/1x1/ls.svg": "4e82463d0f9293120da93e234ebd6d0a",
"assets/flags/flags/1x1/lt.svg": "39f9399afe4e99afc7807a3614269ea6",
"assets/flags/flags/1x1/lu.svg": "0d040ab20ca2d24321a65c76f489b04e",
"assets/flags/flags/1x1/lv.svg": "eeafeb0fec4b2b31672ac508265f1712",
"assets/flags/flags/1x1/ly.svg": "01216c35ae2256ecb79d83d6043f029c",
"assets/flags/flags/1x1/ma.svg": "7fe34c1e160dc851310c1a6469a8379a",
"assets/flags/flags/1x1/mc.svg": "585834807536af77d01bb714e142528a",
"assets/flags/flags/1x1/md.svg": "d692cd261cdb5fddab55e51cb48eba57",
"assets/flags/flags/1x1/me.svg": "af7398f3281863944d779a77ea6354df",
"assets/flags/flags/1x1/mf.svg": "dd318f11d6eb3ce37651702a2ecef0d1",
"assets/flags/flags/1x1/mg.svg": "b23fb375f4dc2242ad3e9df8c9d1e2fc",
"assets/flags/flags/1x1/mh.svg": "6a803acb4c81860bad1b0d7d06271ae1",
"assets/flags/flags/1x1/mk.svg": "aa4bb76fa561509b29d63cd3edd8a1a9",
"assets/flags/flags/1x1/ml.svg": "e264a6264f02dd9b1afba338062b2d75",
"assets/flags/flags/1x1/mm.svg": "558c0aff00891dfe4b5249f8ae1ccfae",
"assets/flags/flags/1x1/mn.svg": "6eadca67629e57a16d08ef9182e9cfc6",
"assets/flags/flags/1x1/mo.svg": "e3d64a20b9cc78250a30b267382d3bee",
"assets/flags/flags/1x1/mp.svg": "999a98e3d0aa29c23faadc276ff2b13a",
"assets/flags/flags/1x1/mq.svg": "f8ab7a69d7fc9c972a0e6a36ab15af81",
"assets/flags/flags/1x1/mr.svg": "d2f11d8354cbddd85a84a4ff40494ce3",
"assets/flags/flags/1x1/ms.svg": "6c242b234deaf52862265b1767c8ebfe",
"assets/flags/flags/1x1/mt.svg": "485b92ba43322d0991016a13ac4f63c9",
"assets/flags/flags/1x1/mu.svg": "b111c44ad076945213b75dc8ec0b9ee4",
"assets/flags/flags/1x1/mv.svg": "8ea7a65ef62eec34311194b49971388c",
"assets/flags/flags/1x1/mw.svg": "5799d8d2ddd1b7c124f0872e0307d30e",
"assets/flags/flags/1x1/mx.svg": "05d67395bc53260d3b3b5e3263dad31c",
"assets/flags/flags/1x1/my.svg": "9ce07fd4c90dd0f4a059668651109a17",
"assets/flags/flags/1x1/mz.svg": "ada074658b6e377797e87c89efb06ff3",
"assets/flags/flags/1x1/na.svg": "f5877d6e14db557e108964bd953d046c",
"assets/flags/flags/1x1/nc.svg": "71d4e8a81e6b59dd2c4b92d343fc4b23",
"assets/flags/flags/1x1/ne.svg": "052dc6649ad238e3437d2bf997edae29",
"assets/flags/flags/1x1/nf.svg": "69e6c4256e9cb84a999e0b71d7c2a9de",
"assets/flags/flags/1x1/ng.svg": "b9197e69f00cd0f998a46b0080c23229",
"assets/flags/flags/1x1/ni.svg": "b377dde52509cbfeac3059cfe2bb8062",
"assets/flags/flags/1x1/nl.svg": "09f3280d2f23aa573c15e3150d550a91",
"assets/flags/flags/1x1/no.svg": "93a89ef2894bcbf6c82115737277da87",
"assets/flags/flags/1x1/np.svg": "8dc76c3d264e94c91fd3414a81bcc0fd",
"assets/flags/flags/1x1/nr.svg": "e6357f8e80628ab251c74487316c4873",
"assets/flags/flags/1x1/nu.svg": "c5c46b882043711f43dc55bfab45d54c",
"assets/flags/flags/1x1/nz.svg": "ece130ad2fe7e4fe7d45c616916d416f",
"assets/flags/flags/1x1/om.svg": "083160ecacd114bd0a3bd3cbab785c7a",
"assets/flags/flags/1x1/pa.svg": "7b97403f84536e43760e6ce4832efef2",
"assets/flags/flags/1x1/pe.svg": "e35d5c9d5d78e5ab04e6ea58ef71e319",
"assets/flags/flags/1x1/pf.svg": "b51ab54cb00fedd475f00d4701c0056d",
"assets/flags/flags/1x1/pg.svg": "63d984fd48cd675c93ee48fbef479a35",
"assets/flags/flags/1x1/ph.svg": "8f080515b1133c2ee1ab4bdd7bc59abd",
"assets/flags/flags/1x1/pk.svg": "f0eea2745a73fcad663607f58bcc86a7",
"assets/flags/flags/1x1/pl.svg": "8dae965602d8036252672fc2f07977eb",
"assets/flags/flags/1x1/pm.svg": "2b4f80598741e6842800e6a9c74c87fb",
"assets/flags/flags/1x1/pn.svg": "afaae19fb2bfab71b496dd1d7b424497",
"assets/flags/flags/1x1/pr.svg": "0e5e97b93e365aa7f8c1a3c7cd944341",
"assets/flags/flags/1x1/ps.svg": "b7495d8b31616f2458f240f17bcf7224",
"assets/flags/flags/1x1/pt.svg": "71c19650f5eee7c1838653388c24d28e",
"assets/flags/flags/1x1/pw.svg": "2084daff74ece4cfddef1abdf54287b3",
"assets/flags/flags/1x1/py.svg": "e16a905eb12173f7df1c0cb01d299477",
"assets/flags/flags/1x1/qa.svg": "3371653310c15d2a37b649abe6e1ee70",
"assets/flags/flags/1x1/re.svg": "36610173ad3d979401c1fad4235c8e1a",
"assets/flags/flags/1x1/ro.svg": "18358326c569c5d7584a6000ad4c87bf",
"assets/flags/flags/1x1/rs.svg": "c2c9251240ed0a55120441c12334ae01",
"assets/flags/flags/1x1/ru.svg": "a36db5ee2456831a8fdd8775a4c7fc82",
"assets/flags/flags/1x1/rw.svg": "7b27db86a2a6c60b656d3f75bf27083e",
"assets/flags/flags/1x1/sa.svg": "7221376f882e7ea5169584bc9ab0548a",
"assets/flags/flags/1x1/sb.svg": "72fc0629b5745867f636e308a9cca387",
"assets/flags/flags/1x1/sc.svg": "29da75118abb5d8283e743f70df21469",
"assets/flags/flags/1x1/sd.svg": "30cf87d02b9440106cc8b913cc62a69f",
"assets/flags/flags/1x1/se.svg": "c385ba828f344e6856e6bcd4441582c8",
"assets/flags/flags/1x1/sg.svg": "b7c7bc4def551a148b519f64961d3122",
"assets/flags/flags/1x1/sh.svg": "d6b5d6490da14c67c2b0301903a4bda8",
"assets/flags/flags/1x1/si.svg": "52f4acef80f640f31459ed26ade1ee2b",
"assets/flags/flags/1x1/sj.svg": "423c02479d090d9f7a4463e555e31678",
"assets/flags/flags/1x1/sk.svg": "80d4eb69228133f72b5dcd7d0f9cb8e8",
"assets/flags/flags/1x1/sl.svg": "7fac599c42ea5816c0bb90036aeffbf6",
"assets/flags/flags/1x1/sm.svg": "ef685a184ac2ab0ce84a8e775eb80ad5",
"assets/flags/flags/1x1/sn.svg": "eed2f85384a1674211601ebf35a9bc72",
"assets/flags/flags/1x1/so.svg": "89f77f8095d9e187d2c5a01710c6583e",
"assets/flags/flags/1x1/sr.svg": "5bd4f0200ffd168102aa2e4b9a16ab83",
"assets/flags/flags/1x1/ss.svg": "ee171740e2f8452ad2c9e7b7e00d7816",
"assets/flags/flags/1x1/st.svg": "60f401932405aa4c4b43c81521638b9b",
"assets/flags/flags/1x1/sv.svg": "a4d3e8f6bcac6ed4f38a5e5b750eca10",
"assets/flags/flags/1x1/sx.svg": "592afe48aa7e894c872a2a46d69bd0a0",
"assets/flags/flags/1x1/sy.svg": "faf27c5b9e2478761658304ead2ab0ab",
"assets/flags/flags/1x1/sz.svg": "0c0920d641aa1d5b2400dfb7229bc841",
"assets/flags/flags/1x1/ta.svg": "3b962f855659dbe313642b98836f2edd",
"assets/flags/flags/1x1/tc.svg": "a9ec70822843f80e881a3a1ea74cf6c8",
"assets/flags/flags/1x1/td.svg": "d2ea13f1a68997e5aff9aeb378d8f454",
"assets/flags/flags/1x1/tf.svg": "8c2401c881ce69e82fd316771cddfd45",
"assets/flags/flags/1x1/tg.svg": "53ea4f1fcd9e50e55bd75f9178d8abe2",
"assets/flags/flags/1x1/th.svg": "18046547363916c7bdfe4556f7cd6989",
"assets/flags/flags/1x1/tj.svg": "6b99e775d483023d8d70868389dde2cb",
"assets/flags/flags/1x1/tk.svg": "a19184cd12d71fae2c2352f1cd8746af",
"assets/flags/flags/1x1/tl.svg": "2f04cd3c63f8b181f5fbcec3b663eb12",
"assets/flags/flags/1x1/tm.svg": "f5fa86cba9314b990145822fce05645c",
"assets/flags/flags/1x1/tn.svg": "690b2529c5259ae494e06cabe407f9f8",
"assets/flags/flags/1x1/to.svg": "ed0e1091a188b0c14c20a47d943cd29c",
"assets/flags/flags/1x1/tr.svg": "63e4c16c4a3a5468dfcab187a831960c",
"assets/flags/flags/1x1/tt.svg": "cd3e7c0c1bc2a0c7ac19297ce411390f",
"assets/flags/flags/1x1/tv.svg": "58748d51b2bfc83e9f85688e7f7d7660",
"assets/flags/flags/1x1/tw.svg": "bf719cfaa4e9735e2305008798a1f970",
"assets/flags/flags/1x1/tz.svg": "d19a8ee928c65adb5fb75e045b2442f5",
"assets/flags/flags/1x1/ua.svg": "4437573c77341db30e92c4d5883944bb",
"assets/flags/flags/1x1/ug.svg": "1f14e988b2453cc3ec03ea21130ee656",
"assets/flags/flags/1x1/um.svg": "030e7e0b164ad395e7125072acda713a",
"assets/flags/flags/1x1/un.svg": "c014d412d6cca3381cb94cc9ba1aa34e",
"assets/flags/flags/1x1/us.svg": "8a22c272b158ecfac41cbeee67e77a05",
"assets/flags/flags/1x1/uy.svg": "5057466c5884fd454ba26904814a76a1",
"assets/flags/flags/1x1/uz.svg": "df614fbf343276517c6361bcaf2b5c7b",
"assets/flags/flags/1x1/va.svg": "fd08979dd5b8e54f717c58d7d489588a",
"assets/flags/flags/1x1/vc.svg": "604bb3c44ede062b803c4a32e6608ca5",
"assets/flags/flags/1x1/ve.svg": "9abd538cea5be0a3928e5ff969ecd071",
"assets/flags/flags/1x1/vg.svg": "1a0a5ff77000f89672e315da2f3f50d8",
"assets/flags/flags/1x1/vi.svg": "6bd9934d32739fb6be598f1c28ea8495",
"assets/flags/flags/1x1/vn.svg": "c0129c1f99d093012669fd27d40d1663",
"assets/flags/flags/1x1/vu.svg": "18634833155b87daf46e8035eff61360",
"assets/flags/flags/1x1/wf.svg": "d0f7d2c119f1cd69a5caba9e83cc2f6f",
"assets/flags/flags/1x1/ws.svg": "9dcd85be09f67d107265077e58629892",
"assets/flags/flags/1x1/xk.svg": "3e564b6fe6c4f80ed86bf610b3d258b1",
"assets/flags/flags/1x1/xx.svg": "308f09e59d3165fb8b6250fc64a40fc0",
"assets/flags/flags/1x1/ye.svg": "c7f96a73720a46764697d8ec9fcd8b37",
"assets/flags/flags/1x1/yt.svg": "07443e1df63cd14e5698363d3a72d17d",
"assets/flags/flags/1x1/za.svg": "66c9b1601cc6d46aca866a44f06cb7db",
"assets/flags/flags/1x1/zm.svg": "9a7407fb4ff20e1457078a1a6c8221f3",
"assets/flags/flags/1x1/zw.svg": "e98fcd0271d56c6abce1bab95b0522b6",
"assets/flags/flags/4x3/ac.svg": "8ab65b7168da5d0907ece0c811ba27d8",
"assets/flags/flags/4x3/ad.svg": "b6176b6bb7b4fe1a7680948a03b60d4b",
"assets/flags/flags/4x3/ae.svg": "42d71570eaa84e61032f934cc8296e79",
"assets/flags/flags/4x3/af.svg": "d5bd54618d08cafed312fb87c3ec1dd2",
"assets/flags/flags/4x3/ag.svg": "3fd09570c4de9060e1806184e7319cb5",
"assets/flags/flags/4x3/ai.svg": "61c09b79f9b83dca2e696b364721df05",
"assets/flags/flags/4x3/al.svg": "d61f657ffb710c529e72e09778b10ef3",
"assets/flags/flags/4x3/am.svg": "39c5d05ed3ce2660746bf8ea995af707",
"assets/flags/flags/4x3/ao.svg": "52753def72744f8ce26c003e58ac89ae",
"assets/flags/flags/4x3/aq.svg": "d96624823ceaf3950ba1b197e1f0b99c",
"assets/flags/flags/4x3/ar.svg": "363f202a5ee831d615c97167a0b6ddb7",
"assets/flags/flags/4x3/arab.svg": "fb354ec534e065e282e2cf1a91d0b072",
"assets/flags/flags/4x3/as.svg": "63d83f8861e06a75d48d7d33501b8afa",
"assets/flags/flags/4x3/at.svg": "8dc68995ec419a9440a25fadc2d8193d",
"assets/flags/flags/4x3/au.svg": "0af6624d4b0ca5e2348e094d3fe0a4bb",
"assets/flags/flags/4x3/aw.svg": "59ef02510bc7df50491a2afea7c5be62",
"assets/flags/flags/4x3/ax.svg": "62ea912b0e8803281b06875985d1c656",
"assets/flags/flags/4x3/az.svg": "403e9b3f84602663476f4139b92916ea",
"assets/flags/flags/4x3/ba.svg": "f7530d423d22fb5a21b1e85dce660fdd",
"assets/flags/flags/4x3/bb.svg": "29e3f9c7760d9479e897e41a2c1b7f13",
"assets/flags/flags/4x3/bd.svg": "e99cb11fdae12d94bce83d228b052dc3",
"assets/flags/flags/4x3/be.svg": "6cac03795313d7c043bbdd4d27c08494",
"assets/flags/flags/4x3/bf.svg": "4755cc0eeffc214e72703111d483703f",
"assets/flags/flags/4x3/bg.svg": "5a32d80ff45984bc53108bc3138df0e7",
"assets/flags/flags/4x3/bh.svg": "86725006a063c2db6d6b0ae08d2a2ae5",
"assets/flags/flags/4x3/bi.svg": "36146887fbe08a73e55c66502dc1bd68",
"assets/flags/flags/4x3/bj.svg": "7f6166b56e8697232afee3eec2516b3e",
"assets/flags/flags/4x3/bl.svg": "d3a9343fe0b3c8fb962790f9d5377200",
"assets/flags/flags/4x3/bm.svg": "39718bd35d6cbeb6cdcbf4dbaa3e7eea",
"assets/flags/flags/4x3/bn.svg": "404809954c8b83ddfdba50802398d4e7",
"assets/flags/flags/4x3/bo.svg": "e42529886ed8d36a5957a87b9069b051",
"assets/flags/flags/4x3/bq.svg": "63fa6eef889e055a5af0496cf8c8adfe",
"assets/flags/flags/4x3/br.svg": "155348d0d5ca941fc05473797fa203b8",
"assets/flags/flags/4x3/bs.svg": "f71baf489ba3415f2f0235a5997254c5",
"assets/flags/flags/4x3/bt.svg": "d35b5dd296478dbb051851d853a280f0",
"assets/flags/flags/4x3/bv.svg": "4a3cbeed34e0e6032a444b5069a94ff3",
"assets/flags/flags/4x3/bw.svg": "8b493920bf8c0e60ff203403e668c73f",
"assets/flags/flags/4x3/by.svg": "a521eebe0cec830d57059207aeb47f7b",
"assets/flags/flags/4x3/bz.svg": "123ac5ce3c479cee7c49698957894722",
"assets/flags/flags/4x3/ca.svg": "f3277db42e8a0498c5f23b58c4d681fe",
"assets/flags/flags/4x3/cc.svg": "ac08a49eaa374f48adcd22d23ce4d3fa",
"assets/flags/flags/4x3/cd.svg": "4346647bc68ddba26c8a09980a380d8a",
"assets/flags/flags/4x3/cefta.svg": "e0e7f32f0b2bfa01a5ff612eaa23e8c7",
"assets/flags/flags/4x3/cf.svg": "99c6b22d8c18aaab72d05274aad88b9a",
"assets/flags/flags/4x3/cg.svg": "c1bacfa71d7a907daa88850a96ff07be",
"assets/flags/flags/4x3/ch.svg": "269ddab4d19b9c60a6459c09ddfd48c9",
"assets/flags/flags/4x3/ci.svg": "71b3f6b842edddfcbd0c964f6c45d7f1",
"assets/flags/flags/4x3/ck.svg": "ae3ea163a41e7acc6ec68d293ee62911",
"assets/flags/flags/4x3/cl.svg": "1cc139d841f80c657a89cbcba1dcd7b7",
"assets/flags/flags/4x3/cm.svg": "71443ef304739e72a4e58627d495084e",
"assets/flags/flags/4x3/cn.svg": "347824ed3b1806718c8881e7e2f13697",
"assets/flags/flags/4x3/co.svg": "eefa6c2cd269ce7da90dc5ac0d78a48a",
"assets/flags/flags/4x3/cp.svg": "5f03d4b2930f96cda5d13452fab7589f",
"assets/flags/flags/4x3/cr.svg": "8f9e3dcc8f47407f57dd2eca6721d415",
"assets/flags/flags/4x3/cu.svg": "950a04a7da10b31931a5723d0c3f0025",
"assets/flags/flags/4x3/cv.svg": "1bd74d973e27c2cc0265d1f858a9b9b5",
"assets/flags/flags/4x3/cw.svg": "fa095496b50c4e4daca119cc11338051",
"assets/flags/flags/4x3/cx.svg": "6b6d55e8b6d588185eaaa3df73899875",
"assets/flags/flags/4x3/cy.svg": "cf67f901b8fbf965ab82433a0d6611df",
"assets/flags/flags/4x3/cz.svg": "859f18a5acfd4e8d702a9b3d539dfd2d",
"assets/flags/flags/4x3/de.svg": "78feb91bfda2ddce6bcfdcbab050995b",
"assets/flags/flags/4x3/dg.svg": "2c1b95ff7dc33e6581fdff4dc322c5e7",
"assets/flags/flags/4x3/dj.svg": "583f0c784590369559b33f3cdda166e7",
"assets/flags/flags/4x3/dk.svg": "33bba71c12896b2df18901d98cf2b62c",
"assets/flags/flags/4x3/dm.svg": "bf34913a0215ab1971637cbbfebf53de",
"assets/flags/flags/4x3/do.svg": "4032809765a012e910a9ca65df17aca7",
"assets/flags/flags/4x3/dz.svg": "b37c4fcf5782f19c46c24f834a141bb1",
"assets/flags/flags/4x3/eac.svg": "48f6e848d8a8b17feb333301d430a206",
"assets/flags/flags/4x3/ec.svg": "d8b5c15adb4f81491e29980a0540b833",
"assets/flags/flags/4x3/ee.svg": "aafa1c5af55d29680fe5e4fbd837e32d",
"assets/flags/flags/4x3/eg.svg": "c6f3bd7a6a60085a0eaae89b72849525",
"assets/flags/flags/4x3/eh.svg": "3dd2a95d917acbd46fb2e6b6111230c4",
"assets/flags/flags/4x3/er.svg": "075f7d29333fde30b467add6d99b87dc",
"assets/flags/flags/4x3/es-ct.svg": "3eb3a35a978070fd4a68db545c527b54",
"assets/flags/flags/4x3/es-ga.svg": "f8eb1159535caad09c46799ed0baf5c4",
"assets/flags/flags/4x3/es-pv.svg": "4abb6c8e4cff61ae92c92aa69e800b50",
"assets/flags/flags/4x3/es.svg": "91221aeba452aeb57c55826c70920835",
"assets/flags/flags/4x3/et.svg": "1df16ee84c344d6df5e9d4db4be956f4",
"assets/flags/flags/4x3/eu.svg": "5503aa8aedc880c6325c08517624e93b",
"assets/flags/flags/4x3/fi.svg": "0e5ef3f583daa1a415330bed83ce8c4a",
"assets/flags/flags/4x3/fj.svg": "16e1816076d0cd120e7d35ba7538f445",
"assets/flags/flags/4x3/fk.svg": "02a718fd0d6c04da291104234aaaeb6d",
"assets/flags/flags/4x3/fm.svg": "2b9aa7bf0231d61730914ef83e91e9fa",
"assets/flags/flags/4x3/fo.svg": "ccfdd328027fbec17a4a07bfeedc4aee",
"assets/flags/flags/4x3/fr.svg": "1359039ac6468ef0d4bcdb6ca17a44a6",
"assets/flags/flags/4x3/ga.svg": "f64e29ed68d2165d3620d53978933bb6",
"assets/flags/flags/4x3/gb-eng.svg": "7caecb785400d1cca7b319887a9d81bf",
"assets/flags/flags/4x3/gb-nir.svg": "4578575b166773870b23186479f16b32",
"assets/flags/flags/4x3/gb-sct.svg": "ade55ed456211d6577b2f80c06e40c51",
"assets/flags/flags/4x3/gb-wls.svg": "9490411928d3db5cad64a17d7c2c9f8b",
"assets/flags/flags/4x3/gb.svg": "fcfef6780b36bef537381474df9d0be9",
"assets/flags/flags/4x3/gd.svg": "416d89879284529a9cf22100792c3079",
"assets/flags/flags/4x3/ge.svg": "63b0311486e63f08f53dffc38591a749",
"assets/flags/flags/4x3/gf.svg": "42b1c6341029dfb99fbce007c8f65586",
"assets/flags/flags/4x3/gg.svg": "6a608369d5207ef50ef840171aef8d40",
"assets/flags/flags/4x3/gh.svg": "b1a97938c1f961df78998f50cc3d542e",
"assets/flags/flags/4x3/gi.svg": "ae1101e67eaf542c6baf10251c5b9187",
"assets/flags/flags/4x3/gl.svg": "c6090a99ab0402116f4ab70719eb034a",
"assets/flags/flags/4x3/gm.svg": "21b07ec656b24882173b9760792b7691",
"assets/flags/flags/4x3/gn.svg": "f1d6c153def70087cff4f84c49ee2fb2",
"assets/flags/flags/4x3/gp.svg": "80fd0125d61bd655171c4671244aa4a8",
"assets/flags/flags/4x3/gq.svg": "52b4ac099f46be415847f63cde06289c",
"assets/flags/flags/4x3/gr.svg": "71452bbd08d693543125cc15f5943637",
"assets/flags/flags/4x3/gs.svg": "842457630714ef5dbd6148b026de24c5",
"assets/flags/flags/4x3/gt.svg": "a2934eca87978546e00d845528d6396e",
"assets/flags/flags/4x3/gu.svg": "3a19af9300cc67ff4a5dc7fe93b1d4e3",
"assets/flags/flags/4x3/gw.svg": "d265b8a005a3ad13e49696e723d622f8",
"assets/flags/flags/4x3/gy.svg": "6a64d2f47b268200557555ac4ffcd8dd",
"assets/flags/flags/4x3/hk.svg": "7f794b0719e1110e0e0c3ce207a0c5ba",
"assets/flags/flags/4x3/hm.svg": "e49ba24a0e759a8d849c4c709adf7fb8",
"assets/flags/flags/4x3/hn.svg": "e0b7ab002f5ea9604ab85057c3a6bbca",
"assets/flags/flags/4x3/hr.svg": "b5756e5502b084e21b4f5942fac6ae79",
"assets/flags/flags/4x3/ht.svg": "62e4ad00be02eeeb4fe70350de141d4a",
"assets/flags/flags/4x3/hu.svg": "966f49336f7466efd6f8dbe19f9fc300",
"assets/flags/flags/4x3/ic.svg": "bdc9877c5d42dfa5adcfb488fcbf153c",
"assets/flags/flags/4x3/id.svg": "f5aa812145ee85fa05e5f2b62bdf030e",
"assets/flags/flags/4x3/ie.svg": "1c12635a2932de4b8036779933a84d97",
"assets/flags/flags/4x3/il.svg": "e1b6374cc60698efddec3e442b159910",
"assets/flags/flags/4x3/im.svg": "324fc467c2aa29e4131f0a6acab88469",
"assets/flags/flags/4x3/in.svg": "2026a3feda4d72351b3b3d6e94ef1325",
"assets/flags/flags/4x3/io.svg": "b99ab7adafb073b2cd13d963af9b3313",
"assets/flags/flags/4x3/iq.svg": "77828901b08c8bde8d09bc969f6fe2bd",
"assets/flags/flags/4x3/ir.svg": "1e5dec24147381ea5c5de99dc3725e3d",
"assets/flags/flags/4x3/is.svg": "64bcaf9743c062aba3fd9914e4abac89",
"assets/flags/flags/4x3/it.svg": "1d72a5dec3acd073763570e3e5fdf784",
"assets/flags/flags/4x3/je.svg": "a1c5d3e3dd0b9cafd46a637f1bc07903",
"assets/flags/flags/4x3/jm.svg": "7c6602774a31cdc41f9ceae4ab057c3f",
"assets/flags/flags/4x3/jo.svg": "414c8c7ba27ed41c53c2f6826ae16aa7",
"assets/flags/flags/4x3/jp.svg": "766ca913ae6b75768804134257ffae80",
"assets/flags/flags/4x3/ke.svg": "f8a1791d61eb73903f2db16cd79ede02",
"assets/flags/flags/4x3/kg.svg": "2a52efa2d9707cafd01231b418f3299f",
"assets/flags/flags/4x3/kh.svg": "747d70423432b8fb38f01540ac7a5e63",
"assets/flags/flags/4x3/ki.svg": "161cfe0396804ecee41759ef38146f76",
"assets/flags/flags/4x3/km.svg": "900d4c39253c987a77fa9e2e9f1a13f1",
"assets/flags/flags/4x3/kn.svg": "28139a3254785fcb2c0177c91c4f2b05",
"assets/flags/flags/4x3/kp.svg": "7120a619d091684ef84353a33a54efa9",
"assets/flags/flags/4x3/kr.svg": "8d191c96496b20498fca3254ed73a266",
"assets/flags/flags/4x3/kw.svg": "31648aa53832f0faa9a7831ac00c1acc",
"assets/flags/flags/4x3/ky.svg": "10c16a67b9bd443b61bdf534c82cd2a1",
"assets/flags/flags/4x3/kz.svg": "d2a7e09a3497a185ec6e0f3cbdc655a5",
"assets/flags/flags/4x3/la.svg": "da34e4818447e1f970b26accdfa69f5d",
"assets/flags/flags/4x3/lb.svg": "01bc572ae24f8d05403a33cd20435935",
"assets/flags/flags/4x3/lc.svg": "940e9ba93eec286b5abee7657cf03283",
"assets/flags/flags/4x3/li.svg": "c43a3f366c2d5d2e5df8d2f580234f45",
"assets/flags/flags/4x3/lk.svg": "37769f4995d75ce20ee4fb3800cb82fc",
"assets/flags/flags/4x3/lr.svg": "babb668c5190507a37835ad407cc3e9a",
"assets/flags/flags/4x3/ls.svg": "4da8ca4f6e1c0d5486f4d6e30256c6d6",
"assets/flags/flags/4x3/lt.svg": "7e7110b65bbe5cbfb8a84a0e5f68284e",
"assets/flags/flags/4x3/lu.svg": "7f70b02c8514c31fc4de448b419ae0d6",
"assets/flags/flags/4x3/lv.svg": "0b4e6e1a21a939a1a474341da5aee4ca",
"assets/flags/flags/4x3/ly.svg": "2fbe5cc18f3eefcf838b055980e63013",
"assets/flags/flags/4x3/ma.svg": "a2e6a76e5f38058fd28b706beeb6a1b7",
"assets/flags/flags/4x3/mc.svg": "acbf04f75fb877d1c2aef0f553c8d629",
"assets/flags/flags/4x3/md.svg": "d4e707da066346718010da32dcbf1802",
"assets/flags/flags/4x3/me.svg": "144e25db369a068c521780d81ee22bcb",
"assets/flags/flags/4x3/mf.svg": "dc1dcaab91f8799fb98af856c44ab8cc",
"assets/flags/flags/4x3/mg.svg": "7a54f12dc753217b1c0aaa7bf685f9fe",
"assets/flags/flags/4x3/mh.svg": "63433c4cd0e5030836734de14bc1e52a",
"assets/flags/flags/4x3/mk.svg": "b96b8a63c2939ef1e4cebb9585908591",
"assets/flags/flags/4x3/ml.svg": "1dd7a9ccbcd179a5a3fba550970ad75c",
"assets/flags/flags/4x3/mm.svg": "cc45ef255cd4f2ca4b320206bde7c700",
"assets/flags/flags/4x3/mn.svg": "1ef812fb28554e7d9b4c2da6b96e89c9",
"assets/flags/flags/4x3/mo.svg": "2a85bb8f0da0cadd0acef2f139a73dc3",
"assets/flags/flags/4x3/mp.svg": "4192a32b80a9cf89083f5b81213899c4",
"assets/flags/flags/4x3/mq.svg": "07af446f3aed2f6fd674dbbf7ee0af6f",
"assets/flags/flags/4x3/mr.svg": "1e7f37e32174aff9a549a221d7f06e14",
"assets/flags/flags/4x3/ms.svg": "19facee5c8b75887494af39fe4ef14eb",
"assets/flags/flags/4x3/mt.svg": "f5c28c0a6c18fc4085c08a50ecfb6d6b",
"assets/flags/flags/4x3/mu.svg": "46514c8008dc3564e49eaa790f28e255",
"assets/flags/flags/4x3/mv.svg": "44a3b21f0ab17367c095a8798f7cc4da",
"assets/flags/flags/4x3/mw.svg": "dc4b154514985cbac37c6023d598243f",
"assets/flags/flags/4x3/mx.svg": "0c810df0ce1f11ce84a0935325e36dbb",
"assets/flags/flags/4x3/my.svg": "a27a161bd27a4e3d62ff3e4365ebc9a6",
"assets/flags/flags/4x3/mz.svg": "660a207e82f5b30d883f583b9bf8bff1",
"assets/flags/flags/4x3/na.svg": "d0cf73691ed55277770d42ec1e0f8507",
"assets/flags/flags/4x3/nc.svg": "c292b9576b6951a3b81714d01975dba9",
"assets/flags/flags/4x3/ne.svg": "5c109026a107f910512b09e208a90538",
"assets/flags/flags/4x3/nf.svg": "cc20348d89f9f1702b1a6760f33697e2",
"assets/flags/flags/4x3/ng.svg": "9eea84efdc0eb2553b9d3502feac044d",
"assets/flags/flags/4x3/ni.svg": "e6fed6ad93973d2c0297712785fde9f5",
"assets/flags/flags/4x3/nl.svg": "f685765a298db5ba59fddfa6de08020e",
"assets/flags/flags/4x3/no.svg": "859a13561a1b24bfa65fb1a03835da49",
"assets/flags/flags/4x3/np.svg": "b1a3346ca5ec563d0daf31fcd16b3bdc",
"assets/flags/flags/4x3/nr.svg": "c3d9797ea73e2d4b760bbec3e07415a0",
"assets/flags/flags/4x3/nu.svg": "bfd6de48e40574ec6d86c6e0589baa48",
"assets/flags/flags/4x3/nz.svg": "a26233e9f6c784c13fe66fb38692156c",
"assets/flags/flags/4x3/om.svg": "3c3ce4b686ea6718dd6e452b17052536",
"assets/flags/flags/4x3/pa.svg": "b6f6c58d78ffe67a54f46163232a8e1e",
"assets/flags/flags/4x3/pe.svg": "615b1c022c3f81b0c1f3b68af9486bd8",
"assets/flags/flags/4x3/pf.svg": "02ac196d434c68c51d62da4cbbfed667",
"assets/flags/flags/4x3/pg.svg": "350974494867e834ec0fae91d98e9efd",
"assets/flags/flags/4x3/ph.svg": "64c3d8b03bf21d10661c2384ebf3247f",
"assets/flags/flags/4x3/pk.svg": "8a893a8934a1b18a440edcba41656228",
"assets/flags/flags/4x3/pl.svg": "f7adaa942c63ca98f1d2362bc67c45e3",
"assets/flags/flags/4x3/pm.svg": "d49c201719224143b226387bc95ebeff",
"assets/flags/flags/4x3/pn.svg": "afd38e5de2e8dd174eb89d9d3695910c",
"assets/flags/flags/4x3/pr.svg": "22cf04d4b9e455467f7e946de5388f88",
"assets/flags/flags/4x3/ps.svg": "9603fcc3025cf8719015679d1623c989",
"assets/flags/flags/4x3/pt.svg": "5c82b7b0f1abb63e8589fa77aa97c555",
"assets/flags/flags/4x3/pw.svg": "34533125088e70e7dc17eadc0f6a151c",
"assets/flags/flags/4x3/py.svg": "d3e57b21c6b9cbe61a792e6592e1811b",
"assets/flags/flags/4x3/qa.svg": "9dfdc1ae61fc572c4d2f7b329a3eeeb5",
"assets/flags/flags/4x3/re.svg": "39cac6fffef990277019ed64ab9e57d4",
"assets/flags/flags/4x3/ro.svg": "e9130a28a9ba2b93433f21a2cd5971f3",
"assets/flags/flags/4x3/rs.svg": "b5dffbf3813427d536241005e79f7fd6",
"assets/flags/flags/4x3/ru.svg": "ab61f31edf4ad95b5ae00aff3be99197",
"assets/flags/flags/4x3/rw.svg": "bea6a030ac9ff2ea9d001efe03ee1d27",
"assets/flags/flags/4x3/sa.svg": "d8c33f2b9bf4620b4abe15b8d983d31c",
"assets/flags/flags/4x3/sb.svg": "30f71378a6f710e849a3f39b6db78182",
"assets/flags/flags/4x3/sc.svg": "ab4767bc4088728a6841e7e578f6c7a8",
"assets/flags/flags/4x3/sd.svg": "a07e8d7a44884656f5de0a323ca6a2ef",
"assets/flags/flags/4x3/se.svg": "e9e24cfb2d85c7e39aafe267fffb0810",
"assets/flags/flags/4x3/sg.svg": "b8d345820ac52f8187155ff5c79ef5b0",
"assets/flags/flags/4x3/sh.svg": "42100063de4741612cb71e9eb2c246a8",
"assets/flags/flags/4x3/si.svg": "a36053434a14a2d477934bb2c1d96dbd",
"assets/flags/flags/4x3/sj.svg": "5b6dddaf6a82ad8090d313f3088b7e2d",
"assets/flags/flags/4x3/sk.svg": "6363e990e97551bbabf9316bf0200d30",
"assets/flags/flags/4x3/sl.svg": "af0884d411f36ff8e0fb199a00b70691",
"assets/flags/flags/4x3/sm.svg": "1553b4ae7cafa07d21a6c993224568ab",
"assets/flags/flags/4x3/sn.svg": "091e42c6f8d95a1740ff343dcec62c7a",
"assets/flags/flags/4x3/so.svg": "a3293a25b2306f930324547134759a0a",
"assets/flags/flags/4x3/sr.svg": "07e91c157e4b9e240d9b004da3529f08",
"assets/flags/flags/4x3/ss.svg": "9a15dd43db84232e2a99b343c73dc2f0",
"assets/flags/flags/4x3/st.svg": "9082dcb0ec4490eebec7370fd2f6bce8",
"assets/flags/flags/4x3/sv.svg": "9167cf279ea378e5912849713b3978c3",
"assets/flags/flags/4x3/sx.svg": "63ad90518412c4bcd621122f4001c822",
"assets/flags/flags/4x3/sy.svg": "b288d06027dd0a86539faa3b1635cc73",
"assets/flags/flags/4x3/sz.svg": "6d06627dddd7560ca527c3f846526e58",
"assets/flags/flags/4x3/ta.svg": "cd7f394fecf83213ed4c64d8a28e3af5",
"assets/flags/flags/4x3/tc.svg": "01d1ae198324759e26ccca8bffd5390b",
"assets/flags/flags/4x3/td.svg": "e092133da9e0fba424dba80e4de91d3f",
"assets/flags/flags/4x3/tf.svg": "d4d6d91ce9d6f4addd54438b6e775e34",
"assets/flags/flags/4x3/tg.svg": "19ba507605e81636029b3ec5ba3ee339",
"assets/flags/flags/4x3/th.svg": "bcc03a3cd1a367274a2444aff71c0a68",
"assets/flags/flags/4x3/tj.svg": "868ef01756b9aaefffe180e29e5b5682",
"assets/flags/flags/4x3/tk.svg": "5a5f29010b5758c306125f3cd2d061b0",
"assets/flags/flags/4x3/tl.svg": "51693b246ea176801243483d3fa69cfd",
"assets/flags/flags/4x3/tm.svg": "b20ff27ce233605ca3e251b22ee70fa5",
"assets/flags/flags/4x3/tn.svg": "e8f63af58ffec829bf6293ae997ee1c5",
"assets/flags/flags/4x3/to.svg": "cccdba4c3dfd080aeda7302c23588c7a",
"assets/flags/flags/4x3/tr.svg": "4dd4b60c8a5e3dad5e65fdfa9745c03f",
"assets/flags/flags/4x3/tt.svg": "db362840eedbb651bff0b539e387bfb6",
"assets/flags/flags/4x3/tv.svg": "c75afdde63ae0e1e205c5dfd653afffe",
"assets/flags/flags/4x3/tw.svg": "a4b47fff88d0596123054bb88aaa2ca2",
"assets/flags/flags/4x3/tz.svg": "4cba6f3545595d585cf1c89394955c71",
"assets/flags/flags/4x3/ua.svg": "6d944bf795f95c09b2f78819af42db89",
"assets/flags/flags/4x3/ug.svg": "235154128bc99f5bb71b593603795d49",
"assets/flags/flags/4x3/um.svg": "c22e6f33f1b04f3879d4c7e35c4c391b",
"assets/flags/flags/4x3/un.svg": "85b3056c96eb0a08c4efc2a8b092bdff",
"assets/flags/flags/4x3/us.svg": "a104996971b30b69ffdc7577c60e0c74",
"assets/flags/flags/4x3/uy.svg": "6e280e71e8370379c96fd5fbb2c8d21a",
"assets/flags/flags/4x3/uz.svg": "8cf7106a9dd1f4ddb59a1a9db1746777",
"assets/flags/flags/4x3/va.svg": "d8cd7e75202091e9f0bab7c34dc782b9",
"assets/flags/flags/4x3/vc.svg": "0d135a5aaa2be532208f06d7ba9f7b08",
"assets/flags/flags/4x3/ve.svg": "5a76b2497118fb0435b2f5845717b9b0",
"assets/flags/flags/4x3/vg.svg": "4447e9aa989eae1c90a988b0eb012752",
"assets/flags/flags/4x3/vi.svg": "781a8f20bc55c65b52c9c445958314f6",
"assets/flags/flags/4x3/vn.svg": "741254692d44818a236a7eab54482e2b",
"assets/flags/flags/4x3/vu.svg": "426001a42378fef5031af625534daace",
"assets/flags/flags/4x3/wf.svg": "4bd619461530b8205477f492e615c86d",
"assets/flags/flags/4x3/ws.svg": "096fc50015e936e5ef310183baab82ca",
"assets/flags/flags/4x3/xk.svg": "13d6a7678c810b9e477d5a633c1afc80",
"assets/flags/flags/4x3/xx.svg": "c15ffa45806fe02417d2bd22e6bd4fca",
"assets/flags/flags/4x3/ye.svg": "d4cc9017b9793281c667ca3d305534ed",
"assets/flags/flags/4x3/yt.svg": "0810a50071df152ecefaa0e479037bff",
"assets/flags/flags/4x3/za.svg": "6ff9a584aaf8fc492bbaf72b12673d08",
"assets/flags/flags/4x3/zm.svg": "c748b3b4f4569a04530f9d676137bdaf",
"assets/flags/flags/4x3/zw.svg": "2fde5b81fab057934f4f6ad264a7cc0b",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "93109155a2749f26c0e44b5cd05af00a",
"assets/NOTICES": "0ab5289b86b518f7976f1ef26d3a85d5",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/shaders/ink_sparkle.frag": "f8b80e740d33eb157090be4e995febdf",
"canvaskit/canvaskit.js": "5caccb235fad20e9b72ea6da5a0094e6",
"canvaskit/canvaskit.wasm": "d9f69e0f428f695dc3d66b3a83a4aa8e",
"canvaskit/chromium/canvaskit.js": "ffb2bb6484d5689d91f393b60664d530",
"canvaskit/chromium/canvaskit.wasm": "393ec8fb05d94036734f8104fa550a67",
"canvaskit/skwasm.js": "95f16c6690f955a45b2317496983dbe9",
"canvaskit/skwasm.wasm": "d1fde2560be92c0b07ad9cf9acb10d05",
"canvaskit/skwasm.worker.js": "51253d3321b11ddb8d73fa8aa87d3b15",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "6b515e434cea20006b3ef1726d2c8894",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "83490c51b4bebdd443ad1e68f988c8bf",
"/": "83490c51b4bebdd443ad1e68f988c8bf",
"main.dart.js": "2b579a49aefa4569a6b31b2e365b34d6",
"manifest.json": "fab79c7ce266304e7b4ec54ff133207a",
"version.json": "514f0c930bffe326b4ad497f56c296fa"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
