// --- Day 7: 01 ---
// https://adventofcode.com/2022/day/7

class Node {
  String type;
  String name;
  int? size;
  List<Node> children = [];
  Node(this.type, this.name);

  bool isDir() {
    return type == "dir";
  }

  bool isFile() {
    return type == "file";
  }
}

class Answer {
  int sum;
  Answer(this.sum);

  void alter(int data) {
    sum += data;
  }
}

int recurs(Node node, Answer answer) {
  int sum = 0;

  for (var child in node.children) {
    if (child.isDir()) {
      sum += recurs(child, answer);
    } else {
      sum += child.size!;
    }
  }

  if (sum <= 100000) {
    answer.alter(sum);
  }

  return sum;
}

int solveA(Iterable<String> input) {
  final input2 = input.toList();
  var root = Node("dir", "/");
  List<Node> stack = [];

  var answer = Answer(0);
  var it = 0;

  while (it < input.length) {
    var el = input2[it];
    print(el);

    if (stack.isEmpty) {
      stack = [root];
    }

    if ((el[0]) == "\$") {
      var cmds = el.split(" ");
      if (cmds[1] == "cd") {
        print(stack.map((e) => e.name));
        if (cmds[2] == "..") {
          if (stack.isNotEmpty) stack.removeLast();
        } else if (cmds[2] == "/") {
          stack = [root];
        } else {
          Node node = stack.last.children
              .firstWhere((element) => element.name == cmds[2]);
          stack.add(node);
        }
      } else {
        it++;
        while (it < input.length) {
          if (input2[it][0] == "\$") {
            it--;
            break;
          }
          var ops = input2[it].split(" ");
          Node node;
          if (ops[0] == "dir") {
            node = Node("dir", ops[1]);
          } else {
            node = Node("file", ops[1]);
            node.size = int.parse(ops[0]);
          }
          stack.last.children.add(node);
          it++;
        }
      }
    }

    it++;
  }

  recurs(root, answer);

  return answer.sum;
}
