defmodule CayleyDiagram do
  @moduledoc """
  Module for creating Cayley diagrams using Erlang's digraph.
  """

  def create_cayley_diagram do
    graph = :digraph.new()

    # Define vertices (group elements)
    vertices = [:e, :a, :b, :c]

    # Add vertices to the graph
    Enum.each(vertices, fn v ->
      :digraph.add_vertex(graph, v)
    end)

    # Define edges (group operations)
    edges = [
      {:e, :a, :a},
      {:a, :b, :c},
      {:b, :c, :a},
      {:c, :e, :c},
      {:a, :a, :e},
      {:b, :b, :e},
      {:c, :c, :e}
    ]

    # Add edges to the graph
    Enum.each(edges, fn {from, to, label} ->
      :digraph.add_edge(graph, from, to, label)
    end)

    graph
  end
end
