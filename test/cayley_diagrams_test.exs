defmodule CayleyDiagramTest do
  use ExUnit.Case
  doctest CayleyDiagram

  test "creates a digraph with the correct vertices and edges" do
    graph = CayleyDiagram.create_cayley_diagram()

    vertices = :digraph.vertices(graph)
    assert Enum.sort(vertices) == [:a, :b, :c, :e]

    edges = :digraph.edges(graph)
    edge_labels = Enum.map(edges, fn edge ->
      {_, from, to, label} = :digraph.edge(graph, edge)
      {from, to, label}
    end)

    expected_edges = [
      {:e, :a, :a},
      {:a, :b, :c},
      {:b, :c, :a},
      {:c, :e, :c},
      {:a, :a, :e},
      {:b, :b, :e},
      {:c, :c, :e}
    ]

    assert Enum.sort(edge_labels) == Enum.sort(expected_edges)

    :digraph.delete(graph)
  end
end
