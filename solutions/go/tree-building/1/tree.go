package tree

import (
	"errors"
	"sort"
)

type Node struct {
	ID       int
	Children []*Node
}

func NewNode(ID int) *Node {
	return &Node{ID: ID}
}

func (n *Node) insertChild(child *Node) error {
	for _, existingChild := range n.Children {
		if child.ID == existingChild.ID {
			return errors.New("duplicate node")
		}
	}
	n.Children = append(n.Children, NewNode(child.ID))
	sort.Slice(n.Children, func(i, j int) bool {
		return n.Children[i].ID < n.Children[j].ID
	})
	return nil
}

type Record struct {
	ID, Parent int
}

func Build(records []Record) (*Node, error) {
	if len(records) == 0 {
		return nil, nil
	}

	err := checkInputRecords(records)
	if err != nil {
		return nil, err
	}

	parentRecord, err := getParentRecord(records)
	if err != nil {
		return nil, err
	}

	rootNode := NewNode(parentRecord.ID)
	records = remove(parentRecord.ID, records)
	records, err = fillNode(rootNode, records)
	if err != nil {
		return nil, err
	}
	for _, child := range rootNode.Children {
		records, err = fillNode(child, records)
		if err != nil {
			return nil, err
		}
	}

	if len(records) != 0 {
		return nil, errors.New("cycle indirectly")
	}

	return rootNode, nil
}

func getParentRecord(records []Record) (Record, error) {
	minParent := records[0]
	for _, record := range records {
		if minParent.ID > record.ID {
			minParent = record
		}
	}
	if minParent.Parent != 0 {
		return Record{}, errors.New("parent node should not have parent")
	}
	if minParent.ID != 0 {
		return Record{}, errors.New("parent node should have zero ID")
	}
	return minParent, nil
}

func checkInputRecords(records []Record) error {
	sorting := records
	sort.Slice(records, func(i, j int) bool {
		return records[i].ID < records[j].ID
	})
	previousID := 0
	rootCounted := 0
	for _, record := range sorting {
		if record.ID > previousID+1 {
			return errors.New("non-continuous")
		}
		if record.ID != 0 && record.ID == record.Parent {
			return errors.New("cycle directly")
		}
		if record.ID < record.Parent {
			return errors.New("higher id parent of lower id")
		}
		if record.ID == 0 {
			rootCounted++
			if rootCounted > 1 {
				return errors.New("duplicate root element")
			}
		}

		previousID = record.ID
	}
	return nil
}

func fillNode(node *Node, records []Record) ([]Record, error) {
	copyRecords := records
	for _, record := range records {
		if node.ID == record.Parent {
			err := node.insertChild(NewNode(record.ID))
			if err != nil {
				return nil, err
			}
			copyRecords = remove(record.ID, copyRecords)
		}
	}
	return copyRecords, nil
}

func remove(ID int, records []Record) []Record {
	for s, record := range records {
		if record.ID == ID {
			records[s] = records[len(records)-1]
			records = records[:len(records)-1]
			return records
		}
	}
	return records
}
