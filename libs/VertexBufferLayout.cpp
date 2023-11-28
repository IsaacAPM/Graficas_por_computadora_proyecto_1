#include "VertexBufferLayout.h"


void VertexBufferLayout::Push(unsigned int type , unsigned int count){
    if(type!=GL_UNSIGNED_BYTE){
	m_Elements.push_back({ type, count, GL_FALSE });
    }else{
	m_Elements.push_back({ type, count, GL_TRUE });
    }
    m_Stride += count * VertexBufferElement::GetSizeOfType(type);
}
