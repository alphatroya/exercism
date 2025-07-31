#[macro_use]
extern crate maplit;

pub mod graph {
    pub mod graph_items {
        pub mod node {
            use std::collections::HashMap;
            use super::super::Attributes;

            #[derive(Clone, PartialEq, Debug)]
            pub struct Node {
                node: String,
                attrs: HashMap<String, String>,
            }

            impl Node {
                pub fn get_node(&self) -> String {
                    self.node.clone()
                }

                pub fn new(node: &str) -> Self {
                    Node { node: node.to_owned(), attrs: hashmap!() }
                }

                pub fn with_attrs(self, attributes: &[(&str, &str)]) -> Self {
                    Node { attrs: self.convert_attributes(attributes), ..self }
                }

                pub fn get_attr(&self, key: &str) -> Option<&str> {
                    self.attrs.get(key).map(|x| &x[..])
                }
            }

            impl Attributes for Node {}
        }

        pub mod edge {
            use std::collections::HashMap;
            use super::super::Attributes;

            #[derive(Clone, Debug, PartialEq)]
            pub struct Edge {
                node_a: String,
                node_b: String,
                attrs: HashMap<String, String>,
            }

            impl Edge {
                pub fn new(a: &str, b: &str) -> Self {
                    Edge {
                        node_a: String::from(a),
                        node_b: String::from(b),
                        attrs: hashmap!(),
                    }
                }

                pub fn with_attrs(self, attributes: &[(&str, &str)]) -> Self {
                    Edge {
                        attrs: self.convert_attributes(attributes),
                        ..self
                    }
                }
            }

            impl Attributes for Edge {}
        }
    }

    use crate::graph::graph_items::node::Node;
    use crate::graph::graph_items::edge::Edge;
    use std::collections::HashMap;

    pub struct Graph {
        pub nodes: Vec<Node>,
        pub edges: Vec<Edge>,
        pub attrs: HashMap<String, String>,
    }

    impl Graph {
        pub fn new() -> Self {
            Graph {
                nodes: vec![],
                edges: vec![],
                attrs: hashmap![],
            }
        }

        pub fn with_nodes(self, nodes: &Vec<Node>) -> Self {
            Graph { nodes: nodes.to_vec(), ..self }
        }

        pub fn with_edges(self, edges: &[Edge]) -> Self {
            Graph { edges: edges.to_vec(), ..self }
        }

        pub fn with_attrs(self, attributes: &[(&str, &str)]) -> Self {
            Graph {
                attrs: self.convert_attributes(attributes),
                ..self
            }
        }

        pub fn get_node(self, name: &str) -> Option<Node> {
            self.nodes.into_iter().find(|x| &x.get_node() == name)
        }
    }

    trait Attributes {
        fn convert_attributes(&self, array: &[(&str, &str)]) -> HashMap<String, String> {
            array.into_iter()
                .map(|x| (x.0.to_owned(), x.1.to_owned()))
                .collect()
        }
    }

    impl Attributes for Graph {}
}
