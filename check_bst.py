""" Node is defined as
class node:
    def __init__(self, data):
        self.data = data
        self.left = None
        self.right = None
"""

max = float("infinity")
min = float("-infinity")

def checkBST(root):
    return isBSTRec(root, min, max)

def isBSTRec(node, min, max):
    if node is None:
        return True
    if node.data < min or node.data > max:
        return False
    return isBSTRec(node.left, min, node.data - 1) and isBSTRec(node.right, node.data + 1, max)
