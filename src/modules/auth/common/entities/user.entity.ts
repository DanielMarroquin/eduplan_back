import { Entity, PrimaryGeneratedColumn, Column, ManyToOne, JoinColumn, CreateDateColumn, UpdateDateColumn } from 'typeorm';
import { Role } from './role.entity';

@Entity('users')
export class User {
    @PrimaryGeneratedColumn()
    id: number;

    @Column({ name: 'id_rol' })
    idRol: number;

    @Column({ name: 'full_name', type: 'varchar', length: 250, nullable: true })
    fullName: string;

    @Column({ type: 'varchar', length: 15 })
    document: string;

    @Column({ type: 'varchar', length: 100 })
    username: string;

    @Column({ type: 'varchar', length: 200 })
    password: string;

    @Column({ type: 'varchar', length: 100 })
    email: string;

    @CreateDateColumn({ name: 'created_at', type: 'timestamp', precision: 6, nullable: true })
    createdAt: Date;

    @Column({ name: 'created_user_id', type: 'int' })
    createdUserId: number;

    @UpdateDateColumn({ name: 'updated_at', type: 'timestamp', precision: 6, nullable: true })
    updatedAt: Date;

    @Column({ type: 'int', default: 1 })
    status: number;

    @ManyToOne(() => Role)
    @JoinColumn({ name: 'id_rol' })
    role: Role;
}
