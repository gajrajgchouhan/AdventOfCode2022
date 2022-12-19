// --- Day 7: 02 ---
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
  Node node;
  Answer(this.node);

  void set(Node data) {
    node = data;
  }
}

int recurs(Node node) {
  int sum = 0;

  for (var child in node.children) {
    if (child.isDir()) {
      sum += recurs(child);
    } else {
      sum += child.size!;
    }
  }

  node.size = sum;

  return sum;
}

void recur(Node node, final int required, Answer curr) {
  for (var child in node.children) {
    if (child.isDir()) {
      recur(child, required, curr);
    }
  }

  if (node.type == "dir" &&
      node.size! >= required &&
      node.size! < curr.node.size!) {
    curr.set(node);
  }
}

int solveA(Iterable<String> input) {
  final input2 = input.toList();
  var root = Node("dir", "/");
  List<Node> stack = [];

  var answer = Answer(root);
  var it = 0;

  while (it < input.length) {
    var el = input2[it];

    if (stack.isEmpty) {
      stack = [root];
    }

    if ((el[0]) == "\$") {
      var cmds = el.split(" ");
      if (cmds[1] == "cd") {
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

  recurs(root);

  final total = 70000000;
  final unused = 30000000;

  if (total - root.size! >= unused) {
    return 0;
  } else {
    final requiredDelete = root.size! + unused - total;
    recur(root, requiredDelete, answer);
    return answer.node.size!;
  }
}
