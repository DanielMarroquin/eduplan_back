import { Entity, PrimaryGeneratedColumn, Column, ManyToMany } from 'typeorm';
// import { Curso } from '../../../courses/'
//
// @Entity('cursos')
// export class Curso {
//     @PrimaryGeneratedColumn()
//     id: number;
//
//     @Column({ type: 'varchar', length: 255 })
//     nombre: string;
//
//     @Column({ type: 'varchar', length: 255, nullable: true })
//     descripcion?: string;
//
//     @ManyToMany(() => Alumno, alumno => alumno.cursos)
//     alumnos: Alumno[];
// }
