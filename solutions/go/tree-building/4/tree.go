package tree

import (
	"errors"
	"sort"
)

// Node object for tree type object storage
type Node struct {
	ID       int
	Children []*Node
}

func newNode(ID int) *Node {
	return &Node{ID: ID}
}

// Record object for flat type storage
type Record struct {
	ID, Parent int
}

// Build convert flat Record structure to tree
func Build(records []Record) (*Node, error) {
	if len(records) == 0 {
		return nil, nil
	}

	sort.Slice(records, func(i, j int) bool {
		return records[i].ID < records[j].ID
	})

	parentRecord := records[0]
	records = records[1:]
	if err := checkParentRecord(parentRecord); err != nil {
		return nil, err
	}

	rootNode, err := constructNodeGraph(parentRecord, records)
	if err != nil {
		return rootNode, err
	}

	return rootNode, nil
}

func constructNodeGraph(parentRecord Record, records []Record) (*Node, error) {
	rootNode := newNode(parentRecord.ID)
	previousID := 0
	mRecords := make(map[int]Record)
	mRecords[0] = parentRecord
	for _, record := range records {
		if record.ID > previousID+1 {
			return nil, errors.New("non-continuous")
		}
		if record.ID != 0 && record.ID == record.Parent {
			return nil, errors.New("cycle directly")
		}
		if record.ID < record.Parent {
			return nil, errors.New("higher id parent of lower id")
		}
		if _, ok := mRecords[record.ID]; ok {
			return nil, errors.New("duplicate")
		}
		mRecords[record.ID] = record
		previousID = record.ID
		records = handle(rootNode, record, records)
	}
	if len(records) != 0 {
		return nil, errors.New("cycle indirectly")
	}

	return rootNode, nil
}

func checkParentRecord(record Record) (err error) {
	if record.Parent != 0 {
		err = errors.New("parent node should not have parent")
	} else if record.ID != 0 {
		err = errors.New("parent node should have zero ID")
	}
	return
}

func handle(node *Node, record Record, records []Record) []Record {
	if node.ID == record.Parent {
		node.Children = append(node.Children, newNode(record.ID))
		records = records[1:]
	} else {
		for _, child := range node.Children {
			records = handle(child, record, records)
		}
	}
	return records
}
