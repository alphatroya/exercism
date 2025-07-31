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
        self.head = Some(Box::new(Node { data: element, next: self.head.take() }))
    }

    pub fn pop(&mut self) -> Option<T> {
        return match self.head.take() {
            None => None,
            Some(value) => {
                let result = Some(value.data);
                self.head = value.next;
                result
            }
        };
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
        let mut result = SimpleLinkedList::new();
        let mut reference = self.head.as_ref();
        while let Some(value) = reference {
            result.push(value.data.clone());
            reference = value.next.as_ref();
        }
        return result;
    }
}

impl<'a, T: Clone> From<&'a [T]> for SimpleLinkedList<T> {
    fn from(_item: &[T]) -> Self {
        let mut result = SimpleLinkedList::new();
        for item in _item {
            result.push(item.clone())
        }
        return result;
    }
}

impl<T> Into<Vec<T>> for SimpleLinkedList<T> {
    fn into(mut self) -> Vec<T> {
        let mut result: Vec<T> = vec![];
        while let Some(value) = self.pop() {
            result.push(value);
        }
        result.reverse();
        result
    }
}
