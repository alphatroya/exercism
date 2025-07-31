pub struct SimpleLinkedList<T> {
    head: Option<Box<Node<T>>>,
}

struct Node<T> {
    data: T,
    next: Option<Box<Node<T>>>,
}

impl<T> Node<T> {
    pub fn len(&self) -> usize {
        match &self.next {
            None => 1,
            Some(value) => value.len() + 1
        }
    }
}

impl<T> SimpleLinkedList<T> {
    pub fn new() -> Self {
        SimpleLinkedList { head: Option::None }
    }

    pub fn len(&self) -> usize {
        match &self.head {
            None => 0,
            Some(value) => value.len()
        }
    }

    pub fn push(&mut self, element: T) {
        let head = self.head;
        self.head = Some(Box::new(Node { data: element, next: head }))
    }

    pub fn pop(&mut self) -> Option<T> {
        unimplemented!()
    }

    pub fn peek(&self) -> Option<&T> {
        match &self.head {
            None => None,
            Some(value) => Some(&value.data)
        }
    }
}

impl<T: Clone> SimpleLinkedList<T> {
    pub fn rev(&self) -> SimpleLinkedList<T> {
        unimplemented!()
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(_item: &[T]) -> Self {
        unimplemented!()
    }
}

impl<T> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(self) -> Vec<T> {
        unimplemented!()
    }
}
