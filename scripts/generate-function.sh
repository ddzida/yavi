#!/bin/bash
set -e
n=16

for i in `seq 1 ${n}`;do
  class="Function${i}"
  file="$(dirname $0)/../src/main/java/am/ik/yavi/fn/${class}.java"
  echo $file
  cat <<EOF > ${file}
/*
 * Copyright (C) 2018-2021 Toshiaki Maki <makingx@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *         http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package am.ik.yavi.fn;

/**
 * Generated by
 * https://github.com/making/yavi/blob/develop/scripts/generate-function.sh
 *
 * @since 0.6.0
 */
@FunctionalInterface
public interface ${class}<$(echo $(for j in `seq 1 ${i}`;do echo -n "T${j}, ";done) | sed 's/,$//'), R> {

	R apply($(echo $(for j in `seq 1 ${i}`;do echo -n "T${j} t${j}, ";done) | sed 's/,$//'));
}
EOF
done