// Copyright (c) 2012, the Dart project authors.  Please see the AUTHORS file
// for details. All rights reserved. Use of this source code is governed by a
// BSD-style license that can be found in the LICENSE file.

library utf.utf32_test;

import 'package:expect/expect.dart';
import 'package:utf/utf.dart';

const String testKoreanCharSubset = """
가각갂갃간갅갆갇갈갉갊갋갌갍갎갏감갑값갓갔강갖갗갘같갚갛
개객갞갟갠갡갢갣갤갥갦갧갨갩갪갫갬갭갮갯갰갱갲갳갴갵갶갷
갸갹갺갻갼갽갾갿걀걁걂걃걄걅걆걇걈걉걊걋걌걍걎걏걐걑걒걓""";

const String testHanTwice = "二";

const List<int> testKoreanCharSubsetUtf32beBom = const <int>[
  0x00, 0x00, 0xfe, 0xff, 0x00, 0x00, 0xac, 0x00, // 8
  0x00, 0x00, 0xac, 0x01, 0x00, 0x00, 0xac, 0x02,
  0x00, 0x00, 0xac, 0x03, 0x00, 0x00, 0xac, 0x04,
  0x00, 0x00, 0xac, 0x05, 0x00, 0x00, 0xac, 0x06,
  0x00, 0x00, 0xac, 0x07, 0x00, 0x00, 0xac, 0x08,
  0x00, 0x00, 0xac, 0x09, 0x00, 0x00, 0xac, 0x0a,
  0x00, 0x00, 0xac, 0x0b, 0x00, 0x00, 0xac, 0x0c,
  0x00, 0x00, 0xac, 0x0d, 0x00, 0x00, 0xac, 0x0e,
  0x00, 0x00, 0xac, 0x0f, 0x00, 0x00, 0xac, 0x10,
  0x00, 0x00, 0xac, 0x11, 0x00, 0x00, 0xac, 0x12,
  0x00, 0x00, 0xac, 0x13, 0x00, 0x00, 0xac, 0x14,
  0x00, 0x00, 0xac, 0x15, 0x00, 0x00, 0xac, 0x16,
  0x00, 0x00, 0xac, 0x17, 0x00, 0x00, 0xac, 0x18,
  0x00, 0x00, 0xac, 0x19, 0x00, 0x00, 0xac, 0x1a,
  0x00, 0x00, 0xac, 0x1b, 0x00, 0x00, 0x00, 0x0a,
  0x00, 0x00, 0xac, 0x1c, 0x00, 0x00, 0xac, 0x1d,
  0x00, 0x00, 0xac, 0x1e, 0x00, 0x00, 0xac, 0x1f,
  0x00, 0x00, 0xac, 0x20, 0x00, 0x00, 0xac, 0x21,
  0x00, 0x00, 0xac, 0x22, 0x00, 0x00, 0xac, 0x23,
  0x00, 0x00, 0xac, 0x24, 0x00, 0x00, 0xac, 0x25,
  0x00, 0x00, 0xac, 0x26, 0x00, 0x00, 0xac, 0x27,
  0x00, 0x00, 0xac, 0x28, 0x00, 0x00, 0xac, 0x29,
  0x00, 0x00, 0xac, 0x2a, 0x00, 0x00, 0xac, 0x2b,
  0x00, 0x00, 0xac, 0x2c, 0x00, 0x00, 0xac, 0x2d,
  0x00, 0x00, 0xac, 0x2e, 0x00, 0x00, 0xac, 0x2f,
  0x00, 0x00, 0xac, 0x30, 0x00, 0x00, 0xac, 0x31,
  0x00, 0x00, 0xac, 0x32, 0x00, 0x00, 0xac, 0x33,
  0x00, 0x00, 0xac, 0x34, 0x00, 0x00, 0xac, 0x35,
  0x00, 0x00, 0xac, 0x36, 0x00, 0x00, 0xac, 0x37,
  0x00, 0x00, 0x00, 0x0a, 0x00, 0x00, 0xac, 0x38,
  0x00, 0x00, 0xac, 0x39, 0x00, 0x00, 0xac, 0x3a,
  0x00, 0x00, 0xac, 0x3b, 0x00, 0x00, 0xac, 0x3c,
  0x00, 0x00, 0xac, 0x3d, 0x00, 0x00, 0xac, 0x3e,
  0x00, 0x00, 0xac, 0x3f, 0x00, 0x00, 0xac, 0x40,
  0x00, 0x00, 0xac, 0x41, 0x00, 0x00, 0xac, 0x42,
  0x00, 0x00, 0xac, 0x43, 0x00, 0x00, 0xac, 0x44,
  0x00, 0x00, 0xac, 0x45, 0x00, 0x00, 0xac, 0x46,
  0x00, 0x00, 0xac, 0x47, 0x00, 0x00, 0xac, 0x48,
  0x00, 0x00, 0xac, 0x49, 0x00, 0x00, 0xac, 0x4a,
  0x00, 0x00, 0xac, 0x4b, 0x00, 0x00, 0xac, 0x4c,
  0x00, 0x00, 0xac, 0x4d, 0x00, 0x00, 0xac, 0x4e,
  0x00, 0x00, 0xac, 0x4f, 0x00, 0x00, 0xac, 0x50,
  0x00, 0x00, 0xac, 0x51, 0x00, 0x00, 0xac, 0x52,
  0x00, 0x00, 0xac, 0x53
];

const List<int> testKoreanCharSubsetUtf32le = const <int>[
  0x00, 0xac, 0x00, 0x00, 0x01, 0xac, 0x00, 0x00, // 8
  0x02, 0xac, 0x00, 0x00, 0x03, 0xac, 0x00, 0x00,
  0x04, 0xac, 0x00, 0x00, 0x05, 0xac, 0x00, 0x00,
  0x06, 0xac, 0x00, 0x00, 0x07, 0xac, 0x00, 0x00,
  0x08, 0xac, 0x00, 0x00, 0x09, 0xac, 0x00, 0x00,
  0x0a, 0xac, 0x00, 0x00, 0x0b, 0xac, 0x00, 0x00,
  0x0c, 0xac, 0x00, 0x00, 0x0d, 0xac, 0x00, 0x00,
  0x0e, 0xac, 0x00, 0x00, 0x0f, 0xac, 0x00, 0x00,
  0x10, 0xac, 0x00, 0x00, 0x11, 0xac, 0x00, 0x00,
  0x12, 0xac, 0x00, 0x00, 0x13, 0xac, 0x00, 0x00,
  0x14, 0xac, 0x00, 0x00, 0x15, 0xac, 0x00, 0x00,
  0x16, 0xac, 0x00, 0x00, 0x17, 0xac, 0x00, 0x00,
  0x18, 0xac, 0x00, 0x00, 0x19, 0xac, 0x00, 0x00,
  0x1a, 0xac, 0x00, 0x00, 0x1b, 0xac, 0x00, 0x00,
  0x0a, 0x00, 0x00, 0x00, 0x1c, 0xac, 0x00, 0x00,
  0x1d, 0xac, 0x00, 0x00, 0x1e, 0xac, 0x00, 0x00,
  0x1f, 0xac, 0x00, 0x00, 0x20, 0xac, 0x00, 0x00,
  0x21, 0xac, 0x00, 0x00, 0x22, 0xac, 0x00, 0x00,
  0x23, 0xac, 0x00, 0x00, 0x24, 0xac, 0x00, 0x00,
  0x25, 0xac, 0x00, 0x00, 0x26, 0xac, 0x00, 0x00,
  0x27, 0xac, 0x00, 0x00, 0x28, 0xac, 0x00, 0x00,
  0x29, 0xac, 0x00, 0x00, 0x2a, 0xac, 0x00, 0x00,
  0x2b, 0xac, 0x00, 0x00, 0x2c, 0xac, 0x00, 0x00,
  0x2d, 0xac, 0x00, 0x00, 0x2e, 0xac, 0x00, 0x00,
  0x2f, 0xac, 0x00, 0x00, 0x30, 0xac, 0x00, 0x00,
  0x31, 0xac, 0x00, 0x00, 0x32, 0xac, 0x00, 0x00,
  0x33, 0xac, 0x00, 0x00, 0x34, 0xac, 0x00, 0x00,
  0x35, 0xac, 0x00, 0x00, 0x36, 0xac, 0x00, 0x00,
  0x37, 0xac, 0x00, 0x00, 0x0a, 0x00, 0x00, 0x00,
  0x38, 0xac, 0x00, 0x00, 0x39, 0xac, 0x00, 0x00,
  0x3a, 0xac, 0x00, 0x00, 0x3b, 0xac, 0x00, 0x00,
  0x3c, 0xac, 0x00, 0x00, 0x3d, 0xac, 0x00, 0x00,
  0x3e, 0xac, 0x00, 0x00, 0x3f, 0xac, 0x00, 0x00,
  0x40, 0xac, 0x00, 0x00, 0x41, 0xac, 0x00, 0x00,
  0x42, 0xac, 0x00, 0x00, 0x43, 0xac, 0x00, 0x00,
  0x44, 0xac, 0x00, 0x00, 0x45, 0xac, 0x00, 0x00,
  0x46, 0xac, 0x00, 0x00, 0x47, 0xac, 0x00, 0x00,
  0x48, 0xac, 0x00, 0x00, 0x49, 0xac, 0x00, 0x00,
  0x4a, 0xac, 0x00, 0x00, 0x4b, 0xac, 0x00, 0x00,
  0x4c, 0xac, 0x00, 0x00, 0x4d, 0xac, 0x00, 0x00,
  0x4e, 0xac, 0x00, 0x00, 0x4f, 0xac, 0x00, 0x00,
  0x50, 0xac, 0x00, 0x00, 0x51, 0xac, 0x00, 0x00,
  0x52, 0xac, 0x00, 0x00, 0x53, 0xac, 0x00, 0x00
];

void main() {
  testUtf32BytesToString();
  testEncodeToUtf32();
  testIterableMethods();
}

void testEncodeToUtf32() {
  Expect.listEquals(
      [], encodeUtf32le(""), "no input"); // TODO(dcarlson) skip bom on empty?
  Expect.listEquals(testKoreanCharSubsetUtf32beBom,
      encodeUtf32(testKoreanCharSubset), "encode UTF-32(BE by default) Korean");
  Expect.listEquals(
      testKoreanCharSubsetUtf32le,
      encodeUtf32le(testKoreanCharSubset),
      "encode UTF-32(LE by default) Korean");
}

void testUtf32BytesToString() {
  Expect.stringEquals("", decodeUtf32([]), "no input");
  Expect.stringEquals("\ufffd", decodeUtf32([0]), "single byte");
  Expect.stringEquals("\ufffd", decodeUtf32([0, 0, 0x4e]), "short a byte");
  Expect.stringEquals(
      "\u4e8c\ufffd", decodeUtf32([0, 0, 0x4e, 0x8c, 0]), "extra byte");

  Expect.stringEquals(
      testHanTwice, decodeUtf32([0, 0, 0x4e, 0x8c]), "twice variation 1");
  Expect.stringEquals(testHanTwice,
      decodeUtf32([0, 0, 0xfe, 0xff, 0, 0, 0x4e, 0x8c]), "twice variation 2");
  Expect.stringEquals(testHanTwice,
      decodeUtf32([0xff, 0xfe, 0, 0, 0x8c, 0x4e, 0, 0]), "twice variation 3");

  Expect.stringEquals(
      testHanTwice, decodeUtf32be([0, 0, 0x4e, 0x8c]), "twice variation 4");
  Expect.stringEquals(testHanTwice,
      decodeUtf32be([0, 0, 0xfe, 0xff, 0, 0, 0x4e, 0x8c]), "twice variation 5");

  Expect.stringEquals(
      testHanTwice, decodeUtf32le([0x8c, 0x4e, 0, 0]), "twice variation 6");
  Expect.stringEquals(testHanTwice,
      decodeUtf32le([0xff, 0xfe, 0, 0, 0x8c, 0x4e, 0, 0]), "twice variation 7");

  Expect.stringEquals(testKoreanCharSubset,
      decodeUtf32(testKoreanCharSubsetUtf32beBom), "UTF-32BE Korean");
}

void testIterableMethods() {
  // empty input
  Expect.isFalse(decodeUtf32AsIterable([]).iterator.moveNext());

  IterableUtf32Decoder koreanDecoder =
      decodeUtf32AsIterable(testKoreanCharSubsetUtf32beBom);
  // get the first character
  Expect.equals(testKoreanCharSubset.codeUnits[0], koreanDecoder.first);
  // get the whole translation using the Iterable interface
  Expect.stringEquals(testKoreanCharSubset,
      new String.fromCharCodes(new List<int>.from(koreanDecoder)));

  // specify types
  Expect.equals(
      44032,
      (new List<int>.from(
          decodeUtf32beAsIterable(testKoreanCharSubsetUtf32beBom)))[0]);
  Expect.equals(
      44032,
      (new List<int>.from(
          decodeUtf32leAsIterable(testKoreanCharSubsetUtf32le)))[0]);
  bool stripBom = false;
  Expect.equals(
      UNICODE_BOM,
      (new List<int>.from(decodeUtf32beAsIterable(
          testKoreanCharSubsetUtf32beBom, 0, null, stripBom)))[0]);
}
