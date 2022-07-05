defmodule BinarySearchTree do
  @type bst_node :: %{data: any, left: bst_node | nil, right: bst_node | nil}

  defmodule BinarySearchTree.Node do
    defstruct data: nil, left: nil, right: nil
  end

  alias BinarySearchTree.Node

  @doc """
  Create a new Binary Search Tree with root's value as the given 'data'
  """
  @spec new(any) :: bst_node
  def new(data) do
    %Node{data: data}
  end

  @doc """
  Creates and inserts a node with its value as 'data' into the tree.
  """
  @spec insert(bst_node, any) :: bst_node
  def insert(%{data: d} = tree, data) when data <= d do
    if tree.left == nil,
      do: %{tree | left: %Node{data: data}},
      else: %{tree | left: insert(tree.left, data)}
  end

  def insert(tree, data) do
    if tree.right == nil,
      do: %{tree | right: %Node{data: data}},
      else: %{tree | right: insert(tree.right, data)}
  end

  @doc """
  Traverses the Binary Search Tree in order and returns a list of each node's data.
  """
  @spec in_order(bst_node) :: [any]
  def in_order(tree) do
    traverse(tree)
  end

  defp traverse(nil), do: []
  defp traverse(tree), do: traverse(tree.left) ++ [tree.data] ++ traverse(tree.right)
end
